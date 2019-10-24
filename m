Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30323E36C0
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 17:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503314AbfJXPdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 11:33:07 -0400
Received: from gofer.mess.org ([88.97.38.141]:42383 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503310AbfJXPdG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 11:33:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6C6B611A001; Thu, 24 Oct 2019 16:33:05 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 1/2] sync v4l-utils.spec with the fedora repo
Date:   Thu, 24 Oct 2019 16:33:04 +0100
Message-Id: <20191024153305.22150-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

https://src.fedoraproject.org/rpms/v4l-utils/blob/master/f/v4l-utils.spec

Signed-off-by: Sean Young <sean@mess.org>
---
 v4l-utils.spec.in | 374 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 279 insertions(+), 95 deletions(-)

diff --git a/v4l-utils.spec.in b/v4l-utils.spec.in
index f1dd0421..d9d46706 100644
--- a/v4l-utils.spec.in
+++ b/v4l-utils.spec.in
@@ -1,21 +1,33 @@
 Name:           v4l-utils
 Version:        @PACKAGE_VERSION@
-Release:        1%{?dist}
+Release:        2%{?dist}
 Summary:        Utilities for video4linux and DVB devices
-Group:          Applications/System
-# ir-keytable and v4l2-sysfs-path are GPLv2 only
+# libdvbv5, dvbv5 utils, ir-keytable and v4l2-sysfs-path are GPLv2 only
 License:        GPLv2+ and GPLv2
 URL:            http://www.linuxtv.org/downloads/v4l-utils/
+
 Source0:        http://linuxtv.org/downloads/v4l-utils/v4l-utils-%{version}.tar.bz2
-Source1:        qv4l2.desktop
-Source2:        qv4l2.svg
-Source3:        qvidcap.desktop
-Source4:        qvidcap.svg
-BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
-BuildRequires:  qt5-qtbase-devel libsysfs-devel kernel-headers desktop-file-utils elfutils-libelf-devel clang
-# For /etc/udev/rules.d ownership
+
+BuildRequires:  alsa-lib-devel
+BuildRequires:  desktop-file-utils
+BuildRequires:  doxygen
+BuildRequires:  gettext
+BuildRequires:  kernel-headers
+BuildRequires:  libjpeg-devel
+BuildRequires:  qt5-qtbase-devel
+BuildRequires:  systemd-devel
+
+# BPF decoder dependencies
+
+%define with_bpf 1
+
+%if %{with_bpf}
+BuildRequires:  elfutils-libelf-devel clang
+%endif
+
+# For /lib/udev/rules.d ownership
 Requires:       udev
-Requires:       libv4l = %{version}-%{release}
+Requires:       libv4l%{?_isa} = %{version}-%{release}
 
 %description
 v4l-utils is a collection of various video4linux (V4L) and DVB utilities. The
@@ -27,7 +39,7 @@ v4l2-ctl and v4l2-sysfs-path.
 Summary:        Utilities for v4l2 / DVB driver development and debugging
 # decode_tm6000 is GPLv2 only
 License:        GPLv2+ and GPLv2
-Requires:       libv4l = %{version}-%{release}
+Requires:       libv4l%{?_isa} = %{version}-%{release}
 
 %description    devel-tools
 Utilities for v4l2 / DVB driver authors: decode_tm6000, v4l2-compliance and
@@ -37,26 +49,14 @@ v4l2-dbg.
 %package -n     qv4l2
 Summary:        QT v4l2 test control and streaming test application
 License:        GPLv2+
-Requires:       libv4l = %{version}-%{release}
+Requires:       libv4l%{?_isa} = %{version}-%{release}
 
 %description -n qv4l2
 QT v4l2 test control and streaming test application.
 
 
-%package -n     qvidcap
-Summary:        QT v4l2 video capture application
-License:        GPLv2+
-Requires:       libv4l = %{version}-%{release}
-
-%description -n qvidcap
-QT v4l2 video capture application for capturing from a video device, but also
-from a file, from a v4l2-ctl compliant network stream, or from a test pattern
-generator.
-
-
 %package -n     libv4l
 Summary:        Collection of video4linux support libraries
-Group:          System Environment/Libraries
 # Some of the decompression helpers are GPLv2, the rest is LGPLv2+
 License:        LGPLv2+ and GPLv2
 URL:            http://hansdegoede.livejournal.com/3636.html
@@ -79,125 +79,309 @@ libv4l2 offers the v4l2 API on top of v4l2 devices, while adding for the
 application transparent libv4lconvert conversion where necessary.
 
 
+%package -n     libdvbv5
+Summary:        Libraries to control, scan and zap on Digital TV channels
+License:        GPLv2
+
+%description -n libdvbv5
+Libraries to control, scan and zap on Digital TV channels
+
 %package -n     libv4l-devel
 Summary:        Development files for libv4l
-Group:          Development/Libraries
 License:        LGPLv2+
 URL:            http://hansdegoede.livejournal.com/3636.html
-Requires:       libv4l = %{version}-%{release}
+Requires:       libv4l%{?_isa} = %{version}-%{release}
 
 %description -n libv4l-devel
 The libv4l-devel package contains libraries and header files for
 developing applications that use libv4l.
 
 
-%prep
-%setup -q
-
-
-%build
-make %{?_smp_mflags} CFLAGS="$RPM_OPT_FLAGS" CXXFLAGS="$RPM_OPT_FLAGS" \
-  PREFIX=%{_prefix} LIBDIR=%{_libdir}
-
-
-%install
-rm -rf $RPM_BUILD_ROOT
-make install PREFIX=%{_prefix} LIBDIR=%{_libdir} DESTDIR=$RPM_BUILD_ROOT
-# below is the desktop file and icon stuff.
-mkdir -p $RPM_BUILD_ROOT%{_datadir}/applications
-desktop-file-install --dir $RPM_BUILD_ROOT%{_datadir}/applications \
-  %{SOURCE1}
-mkdir -p $RPM_BUILD_ROOT%{_datadir}/icons/hicolor/scalable/apps
-install -p -m 644 %{SOURCE2} \
-  $RPM_BUILD_ROOT%{_datadir}/icons/hicolor/scalable/apps
-
-
-%clean
-rm -rf $RPM_BUILD_ROOT
-
-
-%post -n libv4l -p /sbin/ldconfig
+%package -n     libdvbv5-devel
+Summary:        Development files for libdvbv5
+License:        GPLv2
+Requires:       libdvbv5%{?_isa} = %{version}-%{release}
 
-%postun -n libv4l -p /sbin/ldconfig
+%description -n libdvbv5-devel
+The libdvbv5-devel package contains libraries and header
+files for developing applications that use libdvbv5.
 
-%post -n qv4l2
-touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :
 
-%postun -n qv4l2
-if [ $1 -eq 0 ] ; then
-    touch --no-create %{_datadir}/icons/hicolor &>/dev/null
-    gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
-fi
+%prep
+%autosetup -p1
 
-%posttrans -n qv4l2
-gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
+%build
+%configure --disable-static --enable-libdvbv5 --enable-doxygen-man
+# Don't use rpath!
+sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
+sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
+make %{?_smp_mflags}
+make doxygen-run
 
 
-%post -n qvidcap
-touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :
+%install
+%{!?_udevrulesdir: %global _udevrulesdir /lib/udev/rules.d}
+%make_install
+find $RPM_BUILD_ROOT -name '*.la' -exec rm -f {} ';'
+rm -f $RPM_BUILD_ROOT%{_libdir}/{v4l1compat.so,v4l2convert.so}
+mkdir -p $RPM_BUILD_ROOT%{_mandir}/man3/
+cp -arv %{_builddir}/%{name}-%{version}/doxygen-doc/man/man3 $RPM_BUILD_ROOT%{_mandir}/
+rm $RPM_BUILD_ROOT%{_mandir}/man3/_*3
+desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/qv4l2.desktop
+%find_lang %{name}
+%find_lang libdvbv5
 
-%postun -n qvidcap
-if [ $1 -eq 0 ] ; then
-    touch --no-create %{_datadir}/icons/hicolor &>/dev/null
-    gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
-fi
 
-%posttrans -n qvidcap
-gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
+%ldconfig_scriptlets -n libv4l
 
+%ldconfig_scriptlets -n libdvbv5
 
-%files
-%defattr(-,root,root,-)
+%files -f %{name}.lang
 %doc README
 %dir %{_sysconfdir}/rc_keymaps
-%config(noreplace) %{_sysconfdir}/rc_keymaps/*
 %config(noreplace) %{_sysconfdir}/rc_maps.cfg
-%config(noreplace) %{_sysconfdir}/udev/rules.d/70-infrared.rules
+%{_udevrulesdir}/70-infrared.rules
+%{_udevrulesdir}/../rc_keymaps/*
 %{_bindir}/cx18-ctl
-%{_bindir}/ir-keytable
+%{_bindir}/cec*
+%{_bindir}/dvb*
 %{_bindir}/ir-ctl
+%{_bindir}/ir-keytable
 %{_bindir}/ivtv-ctl
+%{_bindir}/media-ctl
+%{_bindir}/rds-ctl
 %{_bindir}/v4l2-ctl
 %{_bindir}/v4l2-sysfs-path
-%{_mandir}/man1/ir-keytable.1*
-%{_mandir}/man5/rc_keymap.5*
-%{_mandir}/man1/ir-ctl.1*
+%{_mandir}/man1/*.1*
+%{_mandir}/man5/*.5*
+%exclude %{_mandir}/man1/qv4l2.1*
+%exclude %{_mandir}/man1/v4l2-compliance.1*
 
 %files devel-tools
-%defattr(-,root,root,-)
 %doc README
 %{_bindir}/decode_tm6000
 %{_bindir}/v4l2-compliance
+%{_mandir}/man1/v4l2-compliance.1*
 %{_sbindir}/v4l2-dbg
 
 %files -n qv4l2
-%defattr(-,root,root,-)
 %doc README
 %{_bindir}/qv4l2
-%{_datadir}/applications/qv4l2.desktop
-%{_datadir}/icons/hicolor/scalable/apps/qv4l2.svg
-
-%files -n qvidcap
-%defattr(-,root,root,-)
-%doc README
 %{_bindir}/qvidcap
+%{_datadir}/applications/qv4l2.desktop
 %{_datadir}/applications/qvidcap.desktop
-%{_datadir}/icons/hicolor/scalable/apps/qvidcap.svg
+%{_datadir}/icons/hicolor/*/apps/qv4l2.*
+%{_datadir}/icons/hicolor/*/apps/qvidcap.*
+%{_mandir}/man1/qv4l2.1*
+%{_mandir}/man1/qvidcap.1*
 
 %files -n libv4l
-%defattr(-,root,root,-)
-%doc COPYING.LIB COPYING ChangeLog README.libv4l TODO
-%{_libdir}/libv4l*.so.*
+%doc ChangeLog README.libv4l TODO
+%license COPYING.libv4l COPYING
 %{_libdir}/libv4l
+%{_libdir}/libv4l*.so.*
 
 %files -n libv4l-devel
-%defattr(-,root,root,-)
 %doc README.lib-multi-threading
 %{_includedir}/libv4l*.h
 %{_libdir}/libv4l*.so
 %{_libdir}/pkgconfig/libv4l*.pc
 
+%files -n libdvbv5 -f libdvbv5.lang
+%doc ChangeLog lib/libdvbv5/README
+%license COPYING
+%{_libdir}/libdvbv5*.so.*
+
+%files -n libdvbv5-devel
+%{_includedir}/libdvbv5/*.h
+%{_libdir}/libdvbv5*.so
+%{_libdir}/pkgconfig/libdvbv5*.pc
+%{_mandir}/man3/*.3*
+
 
 %changelog
-* Thr Oct 06 2011 Mauro Carvalho Chehab <mchehab@kernel.org> 0.9.0-test
-- Initial v4l-utils.spec file
+* Sun Sep 22 2019 Mauro Carvalho Chehab <mchehab+samsung@kernel.org> 1.18.0-1
+- Updated to latest stable release
+
+* Mon Sep 02 2019 Mauro Carvalho Chehab <mchehab+samsung@kernel.org> 1.16.7-1
+- Updated to new fix release with NIT parsing fix
+
+* Sat Jul 27 2019 Fedora Release Engineering <releng@fedoraproject.org> - 1.16.5-4
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_31_Mass_Rebuild
+
+* Wed May  1 2019 Peter Robinson <pbrobinson@fedoraproject.org> 1.16.5-3
+- The actual fix for libdvbv5 (rhbz 1695023)
+
+* Tue Apr 16 2019 Peter Robinson <pbrobinson@fedoraproject.org> 1.16.5-2
+- Upstream fix for libdvbv5 (rhbz 1695023)
+
+* Sun Mar 31 2019 Peter Robinson <pbrobinson@fedoraproject.org> 1.16.5-1
+- New upstream release 1.16.5
+
+* Sun Feb 03 2019 Fedora Release Engineering <releng@fedoraproject.org> - 1.16.3-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_30_Mass_Rebuild
+
+* Mon Dec 17 2018 Mauro Carvalho Chehab <mchehab+samsung@kernel.org> 1.6.3-1
+- Updated to new fix release, with should solve BPF protocol packaging issues
+
+* Thu Nov 22 2018 Mauro Carvalho Chehab <mchehab+samsung@kernel.org> 1.6.2-2
+- Add dependencies needed to build BPF code
+
+* Mon Nov 19 2018 Peter Robinson <pbrobinson@fedoraproject.org> 1.16.2-1
+- New upstream release 1.16.2
+
+* Sat Jul 14 2018 Fedora Release Engineering <releng@fedoraproject.org> - 1.14.2-3
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_29_Mass_Rebuild
+
+* Sun Apr 29 2018 Peter Robinson <pbrobinson@fedoraproject.org> 1.14.2-2
+- Add sys/sysmacros.h include fix patch
+
+* Sun Apr 29 2018 Peter Robinson <pbrobinson@fedoraproject.org> 1.14.2-1
+- New upstream release 1.14.2
+
+* Fri Feb 09 2018 Fedora Release Engineering <releng@fedoraproject.org> - 1.12.5-7
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_28_Mass_Rebuild
+
+* Thu Jan 18 2018 Igor Gnatenko <ignatenkobrain@fedoraproject.org> - 1.12.5-6
+- Remove obsolete scriptlets
+
+* Thu Nov 02 2017 Hans de Goede <hdegoede@redhat.com> - 1.12.5-5
+- Fix libv4lconvert failing on some hardware (rhbz#1508706)
+
+* Thu Aug 03 2017 Fedora Release Engineering <releng@fedoraproject.org> - 1.12.5-4
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_27_Binutils_Mass_Rebuild
+
+* Thu Jul 27 2017 Fedora Release Engineering <releng@fedoraproject.org> - 1.12.5-3
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_27_Mass_Rebuild
+
+* Mon May 15 2017 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.12.5-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_26_27_Mass_Rebuild
+
+* Fri May 12 2017 Hans de Goede <hdegoede@redhat.com> - 1.12.5-1
+- New upstream bugfix release 1.12.5
+
+* Mon May  8 2017 Hans de Goede <hdegoede@redhat.com> - 1.12.4-1
+- New upstream release 1.12.4
+
+* Sun Mar 12 2017 Peter Robinson <pbrobinson@fedoraproject.org> 1.12.3-1
+- New upstream release 1.12.3
+
+* Sun Feb 12 2017 Peter Robinson <pbrobinson@fedoraproject.org> 1.12.2-1
+- New upstream release 1.12.2
+- Add new CEC utils
+
+* Sat Feb 11 2017 Fedora Release Engineering <releng@fedoraproject.org> - 1.10.1-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_26_Mass_Rebuild
+
+* Thu Dec 15 2016 Hans de Goede <hdegoede@redhat.com> - 1.10.1-1
+- New upstream release 1.10.1
+- Fix FTBFS (rhbz#1402087)
+
+* Tue Mar  1 2016 Hans de Goede <hdegoede@redhat.com> - 1.10.0-2
+- Update upside down table to apply to PEGATRON laptops (rhbz#1311545)
+
+* Wed Feb 24 2016 Hans de Goede <hdegoede@redhat.com> - 1.10.0-1
+- Upgrade to new upstream release 1.10.0
+- Use qt5 instead of qt4 for qv4l2
+
+* Fri Feb 05 2016 Fedora Release Engineering <releng@fedoraproject.org> - 1.8.1-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_24_Mass_Rebuild
+
+* Mon Oct 12 2015 Gregor Jasny <gjasny@googlemail.com> - 1.8.1-1
+- Upgrade to version 1.8.1
+
+* Fri Jun 19 2015 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.6.2-3
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_23_Mass_Rebuild
+
+* Sat May 02 2015 Kalev Lember <kalevlember@gmail.com> - 1.6.2-2
+- Rebuilt for GCC 5 C++11 ABI change
+
+* Sat Nov 22 2014 Mauro Carvalho Chehab <mchehab@osg.samsung.com> - 1.6.2-1
+- Update to version 1.6.2 with contains several bugfixes
+
+* Thu Nov 20 2014 Hans de Goede <hdegoede@redhat.com> - 1.6.0-2
+- Fix crash when decoding 1920x1080 jpeg to YUV420
+
+* Sun Oct 05 2014 Mauro Carvalho Chehab - 1.6.0-1
+- Upgrade to version 1.6.0
+
+* Mon Sep 08 2014 Mauro Carvalho Chehab - 1.4.0-1
+- Upgrade to version 1.4.0
+
+* Fri Aug 22 2014 Mauro Carvalho Chehab - 1.2.1-3
+- Add ALSA support on qv4l2 and fix a couple issues at spec file
+
+* Thu Aug 21 2014 Mauro Carvalho Chehab - 1.2.1-2
+- Update to version 1.2.1 and add package for libdvbv5
+
+* Mon Aug 18 2014 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.0.0-3
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_21_22_Mass_Rebuild
+
+* Sun Jun 08 2014 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.0.0-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_21_Mass_Rebuild
+
+* Sat Aug  3 2013 Hans de Goede <hdegoede@redhat.com> - 1.0.0-1
+- New upstream release 1.0.0 final
+- Drop libdvb5 (made private upstream for now)
+
+* Fri Jun 14 2013 Hans de Goede <hdegoede@redhat.com> - 0.9.5-2
+- Add a few libv4l2rds patches from upstream, which bring libv4l2rds to its
+  final API / ABI, so that apps build against it won't need a rebuild in the
+  future
+
+* Sun Jun  9 2013 Hans de Goede <hdegoede@redhat.com> - 0.9.5-1
+- New upstream release 0.9.5 (rhbz#970412)
+- Modernize specfile a bit
+
+* Fri Feb 15 2013 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.8.8-6
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_19_Mass_Rebuild
+
+* Mon Jan 21 2013 Adam Tkac <atkac redhat com> - 0.8.8-5
+- rebuild due to "jpeg8-ABI" feature drop
+
+* Fri Dec 21 2012 Adam Tkac <atkac redhat com> - 0.8.8-4
+- rebuild against new libjpeg
+
+* Sun Jul 22 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.8.8-3
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_18_Mass_Rebuild
+
+* Mon Jul  9 2012 Hans de Goede <hdegoede@redhat.com> - 0.8.8-2
+- Cherry-pick 2 patches from upstream git fixing an exotic crash (rhbz#838279)
+
+* Tue May 22 2012 Hans de Goede <hdegoede@redhat.com> - 0.8.8-1
+- New upstream release 0.8.8
+- Add patches from upstream git to improve Pixart JPEG decoding
+- Add patch from upstream git to fix building with latest kernels (rhbz#823863)
+
+* Mon Apr  9 2012 Hans de Goede <hdegoede@redhat.com> - 0.8.7-1
+- New upstream release 0.8.7
+- Fixes rhbz#807656
+
+* Sat Jan 14 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.8.5-2
+- Rebuilt for https://fedoraproject.org/wiki/Fedora_17_Mass_Rebuild
+
+* Sun Jul 17 2011 Hans de Goede <hdegoede@redhat.com> 0.8.5-1
+- New upstream release 0.8.5
+- Fixes rhbz#711492
+
+* Wed Jun  1 2011 Hans de Goede <hdegoede@redhat.com> 0.8.4-1
+- New upstream release 0.8.4
+
+* Sat Mar 12 2011 Hans de Goede <hdegoede@redhat.com> 0.8.3-2
+- Add a .desktop file for qv4l2
+- Add fully versioned Requires on libv4l to other (sub)packages
+
+* Thu Feb 10 2011 Hans de Goede <hdegoede@redhat.com> 0.8.3-1
+- New upstream release 0.8.3
+
+* Wed Jan 26 2011 Hans de Goede <hdegoede@redhat.com> 0.8.2-3
+- Add missing BuildRequires: kernel-headers
+
+* Mon Jan 24 2011 Hans de Goede <hdegoede@redhat.com> 0.8.2-2
+- Change tarbal to official upstream 0.8.2 release
+- This fixes multiple Makefile issues pointed out in the review (#671883)
+- Add ir-keytable config files
+- Explicitly specify CXXFLAGS so that qv4l2 gets build with rpm_opt_flags too
+
+* Sat Jan 22 2011 Hans de Goede <hdegoede@redhat.com> 0.8.2-1
+- Initial Fedora package
-- 
2.23.0

