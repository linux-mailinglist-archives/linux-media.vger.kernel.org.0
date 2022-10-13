Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771CD5FD422
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 07:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJMFP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 01:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJMFPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 01:15:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6290481F9
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 22:15:17 -0700 (PDT)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7CA80660234D;
        Thu, 13 Oct 2022 06:15:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665638115;
        bh=x1CqOacs6yvi6bK0MSQT1Nb8mloh4H7s1iiRj6mu2BI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oqTWpIsHIVjNHWm9CeofgpHh88iSMK6OiJBqmEb5iLE33J+QkM5HrTWE68yp/Aj7N
         Ol6GN/tl8FP05HQYutD7TBjSvhMJa6XYHdD2hFJnOhn+2BHZ8sCLITRA9vdIzOxRMK
         ccKXg8vU3AiAD+QEDyoFLABZ6pLJs3ooRS9HQyZA8lv1wd+cOFEcFm+Ikcgw022jsk
         nsJ6ND5WuZvg0Si/u4/NLkZ6Kaw8dy7aA6K4pLWVZlaVHpB7lrLgWS4DjYZpXvZRat
         ALyA9/Tr5nQ45xmihKETMHGK5M4lN13BEhXkAcJGg/joG3/Hs6H7agTlLP4MKNw2P0
         csZ6bdS/a79tA==
Date:   Wed, 12 Oct 2022 22:15:52 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, daniel.almeida@collabora.com,
        nfraprado@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH v2] utils: add v4l2-tracer utility
Message-ID: <Y0eeKbQCVcbJBk5Y@xps>
References: <20221004185703.13393-1-deborah.brouwer@collabora.com>
 <bf948c8f-a07a-893a-d974-5deefd88b6f7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf948c8f-a07a-893a-d974-5deefd88b6f7@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 07, 2022 at 03:09:13PM +0200, Hans Verkuil wrote:
> Hi Deb,

Hi Hans - Thanks very much for your review!
I've been working on the changes and have a few responses below.

> 
> On 10/4/22 20:57, Deborah Brouwer wrote:
> > The v4l2-tracer utility traces, records and replays userspace applications
> > that implement the v4l2 memory-to-memory stateless video decoder
> > interface. The trace function intercepts and copies system calls,
> > stateless codec controls and buffers to a json-formatted trace file.
> > The retrace function independently reads and replays the json trace file.
> > The json trace file can be retraced independently from its original
> > userspace environment and can be edited to inject errors to test a
> > driver's error handling abilities.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > Currently supports MPEG2, VP8, H264, FWHT
> > 
> > Changes since v1:
> > - auto-generate code from uAPI headers
> > - generated code adds some ability to trace
> >   VP9/HEVC which compiles but still needs work
> > - generated code adds full support for MPEG2
> > - fix multiplanar decoding for vicodec
> > - change library name to libv4l2tracer
> > - update README
> > - expand help to show options
> > - remove extraneous files from gitignore
> > 
> > Examples:
> > 
> > Trace VP8 decoding:
> > 
> >   v4l2-tracer trace -- gst-launch-1.0 -- filesrc
> >   location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec !
> >   videocodectestsink
> > 
> > Trace H264 decoding:
> > 
> >   v4l2-tracer trace -y -- gst-launch-1.0 -- filesrc
> >   location=test-25fps.h264 ! parsebin ! v4l2slh264dec !
> >   videocodectestsink
> > 
> > Trace FWHT decoding:
> > 
> >   v4l2-tracer trace -- v4l2-ctl -d9 --stream-mmap
> >   --stream-out-mmap --stream-from-hdr test-25fps.fwht
> >   --stream-to out.yuv
> > 
> > Note: if tracing another v4l2 utility like
> > v4l2-ctl, either used the installed versions
> > or configure with:
> >  --disable-dyn-libv4l --disable-v4l2-ctl-libv4l
> > 
> > Retrace:
> >   v4l2-tracer retrace 79568_trace.json
> > 
> > Trace a Retrace:
> >   v4l2-tracer trace -- v4l2-tracer retrace
> >   79568_trace.json
> > 
> >  README                                 |    8 +
> >  configure.ac                           |   12 +
> >  utils/Makefile.am                      |    5 +
> >  utils/v4l2-tracer/.gitignore           |    8 +
> >  utils/v4l2-tracer/Makefile.am          |   33 +
> >  utils/v4l2-tracer/libv4l2tracer.cpp    |  222 ++++
> >  utils/v4l2-tracer/retrace-helper.cpp   |  196 ++++
> >  utils/v4l2-tracer/retracer.cpp         | 1319 ++++++++++++++++++++++++
> >  utils/v4l2-tracer/trace-helper.cpp     |  816 +++++++++++++++
> >  utils/v4l2-tracer/trace-helper.h       |   51 +
> >  utils/v4l2-tracer/trace.cpp            |  669 ++++++++++++
> >  utils/v4l2-tracer/v4l2-tracer-common.h |   40 +
> >  utils/v4l2-tracer/v4l2-tracer-gen.pl   |  359 +++++++
> >  utils/v4l2-tracer/v4l2-tracer.1.in     |  104 ++
> >  utils/v4l2-tracer/v4l2-tracer.cpp      |  187 ++++
> >  15 files changed, 4029 insertions(+)
> >  create mode 100644 utils/v4l2-tracer/.gitignore
> >  create mode 100644 utils/v4l2-tracer/Makefile.am
> >  create mode 100644 utils/v4l2-tracer/libv4l2tracer.cpp
> >  create mode 100644 utils/v4l2-tracer/retrace-helper.cpp
> >  create mode 100644 utils/v4l2-tracer/retracer.cpp
> >  create mode 100644 utils/v4l2-tracer/trace-helper.cpp
> >  create mode 100644 utils/v4l2-tracer/trace-helper.h
> >  create mode 100644 utils/v4l2-tracer/trace.cpp
> >  create mode 100644 utils/v4l2-tracer/v4l2-tracer-common.h
> >  create mode 100755 utils/v4l2-tracer/v4l2-tracer-gen.pl
> >  create mode 100644 utils/v4l2-tracer/v4l2-tracer.1.in
> >  create mode 100644 utils/v4l2-tracer/v4l2-tracer.cpp
> > 
> > diff --git a/README b/README
> > index a7759171..c5b6df16 100644
> > --- a/README
> > +++ b/README
> > @@ -45,6 +45,8 @@ you'll need also:
> >  	alsa-lib-devel doxygen libjpeg-turbo-devel qt5-qtbase-devel
> >  	libudev-devel mesa-libGLU-devel
> >  
> > +The v4l2-tracer also needs the json-c library.
> > +On Debian: libjson-c-dev; on Fedora: json-c-devel.
> >  
> >  After downloading and installing the needed packages, you should run:
> >  
> > @@ -227,6 +229,12 @@ v4l2-sysfs-path:
> >  FIXME add description.
> >  Installed by make install under <prefix>/bin.
> >  
> > +v4l2-tracer:
> > +Tool to trace, record and replay userspace applications
> > +that implement the v4l2 memory-to-memory stateless video
> > +decoder interface.
> > +Installed by make install under <prefix>/bin.
> 
> make install -> 'make install'
> 
> > +
> >  xc3028-firmware:
> >  Xceive XC2028/3028 tuner module firmware manipulation tool.
> >  xc3028-firmware does not get installed by make install.
> 
> <snip>
> 
> > diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
> > new file mode 100644
> > index 00000000..c344d8a1
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> > @@ -0,0 +1,222 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2022 Collabora Ltd.
> > + */
> > +
> > +#include <dlfcn.h>
> > +#include <stdarg.h>
> > +#include <config.h> /* For PROMOTED_MODE_T */
> > +#include "v4l2-tracer-common.h"
> > +#include "trace-helper.h"
> > +
> > +/* from trace.cpp */
> > +void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64);
> > +void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off,
> > +                unsigned long buf_address, bool is_mmap64);
> > +void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
> > +void trace_mem_encoded(int fd, __u32 offset);
> > +json_object *trace_ioctl_args(int fd, unsigned long request, void *arg,
> > +                              bool from_userspace = true);
> > +
> > +int open(const char *path, int oflag, ...)
> > +{
> > +	errno = 0;
> > +	mode_t mode = 0;
> > +
> > +	if (oflag & O_CREAT) {
> > +		va_list ap;
> > +		va_start(ap, oflag);
> > +		mode = va_arg(ap, PROMOTED_MODE_T);
> > +		va_end(ap);
> > +	}
> > +
> > +	int (*original_open)(const char *path, int oflag, ...);
> > +	original_open = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open");
> > +	int fd = (*original_open)(path, oflag, mode);
> > +
> > +	if (is_video_or_media_device(path)) {
> > +		if (!options_are_set())
> > +			set_options();
> > +		add_device(fd, path);
> > +		trace_open(fd, path, oflag, mode, false);
> > +	}
> > +
> > +	return fd;
> > +}
> > +
> > +int open64(const char *path, int oflag, ...)
> > +{
> > +	errno = 0;
> > +	mode_t mode = 0;
> > +	if (oflag & O_CREAT) {
> > +		va_list ap;
> > +		va_start(ap, oflag);
> > +		mode = va_arg(ap, PROMOTED_MODE_T);
> > +		va_end(ap);
> > +	}
> > +
> > +	int (*original_open64)(const char *path, int oflag, ...);
> > +	original_open64 = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open64");
> > +	int fd = (*original_open64)(path, oflag, mode);
> > +
> > +	if (is_video_or_media_device(path)) {
> > +		if (!options_are_set())
> > +			set_options();
> > +		add_device(fd, path);
> > +		trace_open(fd, path, oflag, mode, true);
> > +	}
> > +
> > +	return fd;
> > +}
> > +
> > +int close(int fd)
> > +{
> > +	errno = 0;
> > +	std::string path = get_device(fd);
> > +
> > +	/* Only trace the close if a corresponding open was also traced. */
> > +	if (!path.empty()) {
> > +		json_object *close_obj = json_object_new_object();
> > +		json_object_object_add(close_obj, "syscall_str", json_object_new_string("close"));
> > +		json_object_object_add(close_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_CLOSE));
> 
> Do you need to provide both a syscall_str and syscall value? Wouldn't the string be sufficient?
> 
> The replayer can just map the string to the syscall number.

Yes, that makes sense.  Since there are so few syscalls traced, I have
been using an enum of the syscalls that the tracer uses, instead of
their actual syscall numbers.  So it would look like e.g.:
{"syscall":"ioctl","fd":4,"cmd":"MEDIA_IOC_G_TOPOLOGY"},

and then then string would map back to the enum e.g.:

constexpr val_def defs_libv4l2tracer_syscall[] = {
	{ LIBV4L2TRACER_SYSCALL_IOCTL,	"ioctl" },


> 
> > +		json_object_object_add(close_obj, "fd", json_object_new_int(fd));
> > +		json_object_object_add(close_obj, "path", json_object_new_string(path.c_str()));
> > +		write_json_object_to_json_file(close_obj);
> > +		json_object_put(close_obj);
> > +		remove_device(fd);
> > +
> > +		/* If we removed the last device, close the json trace file. */
> > +		if (!count_devices())
> > +			close_json_file();
> > +	}
> > +
> > +	int (*original_close)(int fd);
> > +	original_close = (int (*)(int)) dlsym(RTLD_NEXT, "close");
> > +
> > +	return (*original_close)(fd);
> > +}
> > +
> > +void *mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
> > +{
> > +	errno = 0;
> > +	void *(*original_mmap)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
> > +	original_mmap = (void*(*)(void*, size_t, int, int, int, off_t)) dlsym(RTLD_NEXT, "mmap");
> > +	void *buf_address_pointer = (*original_mmap)(addr, len, prot, flags, fildes, off);
> > +
> > +	set_buffer_address_trace(fildes, off, (unsigned long) buf_address_pointer);
> > +
> > +	if (buffer_in_trace_context(fildes, off))
> > +		trace_mmap(addr, len, prot, flags, fildes, off, (unsigned long) buf_address_pointer, false);
> > +
> > +	return buf_address_pointer;
> > +}
> > +
> > +void *mmap64(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
> > +{
> > +	errno = 0;
> > +	void *(*original_mmap64)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
> > +	original_mmap64 = (void*(*)(void*, size_t, int, int, int, off_t)) dlsym(RTLD_NEXT, "mmap64");
> > +	void *buf_address_pointer = (*original_mmap64)(addr, len, prot, flags, fildes, off);
> > +
> > +	set_buffer_address_trace(fildes, off, (unsigned long) buf_address_pointer);
> > +
> > +	if (buffer_in_trace_context(fildes, off))
> > +		trace_mmap(addr, len, prot, flags, fildes, off, (unsigned long) buf_address_pointer, true);
> > +
> > +	return buf_address_pointer;
> > +}
> > +
> > +int munmap(void *start, size_t length)
> > +{
> > +	errno = 0;
> > +	int(*original_munmap)(void *start, size_t length);
> > +	original_munmap = (int(*)(void *, size_t)) dlsym(RTLD_NEXT, "munmap");
> > +	int ret = (*original_munmap)(start, length);
> > +
> > +	/* Only trace the unmapping if the original mapping was traced. */
> > +	if (!buffer_is_mapped((unsigned long) start))
> > +		return ret;
> > +
> > +	json_object *munmap_obj = json_object_new_object();
> > +	json_object_object_add(munmap_obj, "syscall_str", json_object_new_string("munmap"));
> > +	json_object_object_add(munmap_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_MUNMAP));
> > +
> > +	if (errno) {
> > +		json_object_object_add(munmap_obj, "errno", json_object_new_int(errno));
> > +		json_object_object_add(munmap_obj, "errno_str", json_object_new_string(strerror(errno)));
> > +	}
> > +
> > +	json_object *munmap_args = json_object_new_object();
> > +	json_object_object_add(munmap_args, "start", json_object_new_int64((int64_t)start));
> > +	json_object_object_add(munmap_args, "length", json_object_new_uint64(length));
> > +	json_object_object_add(munmap_obj, "munmap_args", munmap_args);
> > +
> > +	write_json_object_to_json_file(munmap_obj);
> > +	json_object_put(munmap_obj);
> > +
> > +	return ret;
> > +}
> > +
> > +int ioctl(int fd, unsigned long request, ...)
> 
> I think 'request' is a confusing name, esp. since codecs use the Request API.
> I see it comes from the man page, but in this case I would rename it to 'cmd',
> which is what it is called in e.g. v4l2-ioctl.c and fs/ioctl.c.

Agreed - I had just gotten used to that but it is confusing.

> 
> > +{
> > +	errno = 0;
> > +	va_list ap;
> > +	va_start(ap, request);
> > +	void *arg = va_arg(ap, void *);
> > +	va_end(ap);
> > +
> > +	int (*original_ioctl)(int fd, unsigned long request, ...);
> > +	original_ioctl = (int (*)(int, long unsigned int, ...)) dlsym(RTLD_NEXT, "ioctl");
> > +
> > +	if ((request == VIDIOC_S_EXT_CTRLS) && (_IOC_TYPE(request) == 'V'))
> 
> Why check _IOC_TYPE? That's already encoded in VIDIOC_S_EXT_CTRLS, so testing for
> that should be sufficient. Ditto for the same checks below.

OK, will fix.

> 
> > +		s_ext_ctrls_setup(static_cast<struct v4l2_ext_controls*>(arg));
> > +
> > +	if ((request == VIDIOC_QBUF) && (_IOC_TYPE(request) == 'V'))
> > +		qbuf_setup(static_cast<struct v4l2_buffer*>(arg));
> > +
> > +	if ((request == VIDIOC_STREAMOFF) && (_IOC_TYPE(request) == 'V'))
> > +		streamoff_cleanup(*(static_cast<v4l2_buf_type*>(arg)));
> > +
> > +	json_object *ioctl_obj = json_object_new_object();
> > +	json_object_object_add(ioctl_obj, "syscall_str", json_object_new_string("ioctl"));
> > +	json_object_object_add(ioctl_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_IOCTL));
> > +	json_object_object_add(ioctl_obj, "fd", json_object_new_int(fd));
> > +	json_object_object_add(ioctl_obj, "request", json_object_new_uint64(request));
> > +	json_object_object_add(ioctl_obj, "request_str",
> > +	                       json_object_new_string(get_ioctl_request_str(request).c_str()));
> 
> So this would be renamed to "cmd" and "cmd_str". But, do you really need both?
> I think you could just store the string:
> 
> "syscall_str":"ioctl","syscall":0,"fd":5,"cmd":"VIDIOC_QUERYCAP"
> 
> When you replay it, it is easy enough to map the cmd string to the actual value.
> 
> If for some reason a non-V4L2 cmd value is used, then you can write "0xHHHHHHHH"
> as the value, and the replay would take that as the cmd hex value.

One issue i've struggled with is whether to trace ioctls that aren't in
videodev2.h or media.h.  For example one that comes up is DMA_BUF_IOCTL_SYNC.
Since the purpose of the v4l2-tracer isn't to comprehensively trace
system calls, I'm leaning toward not tracing these ioctls at all.  They
aren't needed by the retracer, the retracer won't replay them because it
won't have all their arguments, and they add clutter making it harder to spot
important differences between the trace and retrace results.

However, it's different for just flags or other values that aren't
recognized, those can be added as a hex string and then replayed
e.g.:
"flags":"V4L2_VP8_FRAME_FLAG_SHOW_FRAME, 0x40"}

From what I understand this could be useful to inject errors through
replaying.

> 
> > +
> > +	/* Trace the ioctl arguments provided by userspace. */
> > +	json_object *ioctl_args_userspace = trace_ioctl_args(fd, request, arg);
> > +	if (json_object_object_length(ioctl_args_userspace))
> > +		json_object_object_add(ioctl_obj, "ioctl_args_from_userspace", ioctl_args_userspace);
> > +
> > +	/* Make the original ioctl call. */
> > +	int ret = (*original_ioctl)(fd, request, arg);
> > +
> > +	if (errno) {
> > +		json_object_object_add(ioctl_obj, "errno", json_object_new_int(errno));> +		json_object_object_add(ioctl_obj, "errno_str", json_object_new_string(strerror(errno)));
> 
> Why not just store the error define: e.g. "EINVAL". And if the errno code isn't known,
> then just store it as a number "12345". It's much shorter than using the strerror()
> result, and even easier to read.

Yes, I would use strerrorname_np(errno) and get a result like "errno":"EINVAL".

> 
> It's a general theme throughout: whenever you write "foo":F,"foo_str":"Foo bar" you
> can also write: "foo":"FOO" where FOO is the V4L2 define, or a decimal or hex value
> if the value didn't map to a define.
> 
> So this:
> 
> {
>   "syscall_str":"ioctl",
>   "syscall":0,
>   "fd":5,
>   "request":3234878981,
>   "request_str":"VIDIOC_S_FMT",
>   "ioctl_args_from_userspace":{
>     "v4l2_format":{
>       "type":10,
>       "type_str":"Video Output Multiplanar",
>       "v4l2_pix_format_mplane":{
>         "width":320,
>         "height":240,
>         "pixelformat":875967059,
>         "pixelformat_str":"H.264 Parsed Slice Data",
>         "fcc_str":"S264",
>         "field":0,
>         "field_str":"Any",
>         "colorspace":0,
>         "colorspace_str":"Default",
>         "num_planes":0,
>         "flags":0,
>         "flags_str":"",
>         "ycbcr_enc":0,
>         "ycbcr_enc_str":"Default",
>         "quantization":0,
>         "quantization_str":"Default",
>         "xfer_func":0,
>         "xfer_func_str":"Default"
>       }
>     }
>   },
> 
> could become:
> 
> {
>   "syscall":"ioctl",
>   "fd":5,
>   "cmd":"VIDIOC_S_FMT",
>   "ioctl_args_from_userspace":{
>     "v4l2_format":{
>       "type":"V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE",
>       "v4l2_pix_format_mplane":{
>         "width":320,
>         "height":240,
>         "pixelformat":"V4L2_PIX_FMT_H264_SLICE",
>         "fcc_str":"S264",   // I'm not sure if this is useful or not
>         "field":"V4L2_FIELD_ANY",
>         "colorspace":"V4L2_COLORSPACE_DEFAULT",
>         "num_planes":0,
>         "flags":0,
>         "flags_str":"", // I'm not sure if this is useful
>         "ycbcr_enc":"V4L2_YCBCR_ENC_DEFAULT",
>         "quantization":"V4L2_QUANTIZATION_DEFAULT",
>         "xfer_func":"V4L2_XFER_FUNC_DEFAULT",
>       }
>     }
>   },
> 
> 
> Here is a more representative example of "flags":
> 
>       "flags":8404993,
>       "flags_str":"mapped, request-fd, ts-copy, ts-src-eof",
> 

Sounds good, I have been working on just using strings and then
converting them back to values in the retracer. So there would be just
one entry for values that are more informative as strings like buffer
type and flags e.g.
"flags":"V4L2_VP8_LF_ADJ_ENABLE, V4L2_VP8_LF_DELTA_UPDATE"}

Then the retracer would turn it back to an integer before making the
call. The autogenerated code from v4l2-controls.h makes this easy to do
without typos.


> I'm wondering if flags_str is really useful. One question I have is whether
> it is possible to direct json to write "flags" as a hex value instead of
> decimal. It's much easier to decode a hex value to the corresponding bits
> than doing that with a decimal value.

No, as far as i know, the json-c library just has decimal integers and strings.
But I can just convert unknown numbers to a hex string (and then reverse for the retracer)
and this is what I would do for unrecognized flags or other values.

> 
> The other issue is that it makes the json file larger.
> 
> I'm actually wondering if it wouldn't be better to keep the json file
> as compact as possible, since it is not human readable regardless of how
> you massage it :-).
> 
> Instead I wonder if it would be possible to add an option that reads the
> json file and then outputs a really human readable version.
> 
> I'm not sure what is easiest/best here.

I have tried it both ways - making the json-file super compact with just
numbers and no strings and also, the awkward hybrid that you see with
the values and then value_str to follow.  The reason I like to see the
strings is that I find myself looking at the json file a lot to compare
or see what is happening or has gone wrong. I found it annoying to leave
that information out of the json file.  I think it will improve the
readability to get rid of the duplication as you suggest.  A separate
human-readable file without json and with options for controlling the
level of detail would be good too, but maybe a future improvement.

> 
> > +	}
> > +
> > +	/* Also trace the ioctl arguments as modified by the driver. */
> > +	json_object *ioctl_args_driver = trace_ioctl_args(fd, request, arg, false);
> > +	if (json_object_object_length(ioctl_args_driver))
> > +		json_object_object_add(ioctl_obj, "ioctl_args_from_driver", ioctl_args_driver);
> > +
> > +	write_json_object_to_json_file(ioctl_obj);
> > +	json_object_put(ioctl_obj);
> > +
> > +	if ((request == VIDIOC_G_FMT) && (_IOC_TYPE(request) == 'V'))
> > +		g_fmt_setup_trace(static_cast<struct v4l2_format*>(arg));
> > +
> > +	if ((request == VIDIOC_S_FMT) && (_IOC_TYPE(request) == 'V'))
> > +		s_fmt_setup(static_cast<struct v4l2_format*>(arg));
> > +
> > +	if ((request == VIDIOC_EXPBUF) && (_IOC_TYPE(request) == 'V'))
> > +		expbuf_setup(static_cast<struct v4l2_exportbuffer*>(arg));
> > +
> > +	if ((request == VIDIOC_QUERYBUF) && (_IOC_TYPE(request) == 'V'))
> > +		querybuf_setup(fd, static_cast<struct v4l2_buffer*>(arg));
> > +
> > +	return ret;
> > +}
> > diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
> > new file mode 100644
> > index 00000000..37fad2c3
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/retrace-helper.cpp
> > @@ -0,0 +1,196 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2022 Collabora Ltd.
> > + */
> > +
> > +#include "v4l2-tracer-common.h"
> > +
> > +struct buffer_retrace {
> > +	int fd;
> > +	__u32 type; /* enum v4l2_buf_type */
> > +	__u32 index;
> > +	__u32 offset;
> > +	long address_trace;
> > +	long address_retrace;
> > +};
> > +
> > +struct retrace_context {
> > +	__u32 width;
> > +	__u32 height;
> > +	__u32 pixelformat;
> > +	pthread_mutex_t lock;
> > +	/* Key is a file descriptor from the trace, value is the corresponding fd in the retrace. */
> > +	std::unordered_map<int, int> retrace_fds;
> > +	/* List of output and capture buffers being retraced. */
> > +	std::list<struct buffer_retrace> buffers;
> > +};
> > +
> > +static struct retrace_context ctx_retrace = {
> > +	.lock = PTHREAD_MUTEX_INITIALIZER
> > +};
> > +
> > +bool buffer_in_retrace_context(int fd, __u32 offset)
> > +{
> > +	bool buffer_in_retrace_context = false;
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto &b : ctx_retrace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			buffer_in_retrace_context = true;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +	return buffer_in_retrace_context;
> > +}
> > +
> > +int get_buffer_fd_retrace(__u32 type, __u32 index)
> > +{
> > +	int fd = 0;
> 
> Hmm, strictly speaking 0 is a valid file descriptor number:
> typically it maps to stdin. Usually -1 is used to denote an
> invalid fd.

Ok, I will fix.

> 
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto &b : ctx_retrace.buffers) {
> > +		if ((b.type == type) && (b.index == index)) {
> > +			fd = b.fd;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +	return fd;
> > +}
> > +
> > +void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	struct buffer_retrace buf = {};
> > +	buf.fd = fd;
> > +	buf.type = type;
> > +	buf.index = index;
> > +	buf.offset = offset;
> > +	ctx_retrace.buffers.push_front(buf);
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +void remove_buffer_retrace(int fd)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
> > +		if (it->fd == fd) {
> > +			ctx_retrace.buffers.erase(it);
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto &b : ctx_retrace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			b.address_trace = address_trace;
> > +			b.address_retrace = address_retrace;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +long get_retrace_address_from_trace_address(long address_trace)
> > +{
> > +	long address_retrace = 0;
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto &b : ctx_retrace.buffers) {
> > +		if (b.address_trace == address_trace) {
> > +			address_retrace = b.address_retrace;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +	return address_retrace;
> > +}
> > +
> > +void print_buffers_retrace(void)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	for (auto &b : ctx_retrace.buffers) {
> > +		fprintf(stderr, "fd: %d, offset: %d, address_trace:%ld, address_retrace:%ld\n",
> > +		        b.fd, b.offset, b.address_trace, b.address_retrace);
> > +	}
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +/*
> > + * Create a new file descriptor entry in retrace context.
> > + * Add both the fd from the trace context and the corresponding fd from the retrace context.
> > + */
> > +void add_fd(int fd_trace, int fd_retrace)
> > +{
> > +	std::pair<int, int> new_pair;
> > +	new_pair = std::make_pair(fd_trace, fd_retrace);
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	ctx_retrace.retrace_fds.insert(new_pair);
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +int get_fd_retrace_from_fd_trace(int fd_trace)
> > +{
> > +	int fd_retrace = 0;
> > +	std::unordered_map<int, int>::const_iterator it;
> > +
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	it = ctx_retrace.retrace_fds.find(fd_trace);
> > +	if (it != ctx_retrace.retrace_fds.end())
> > +		fd_retrace = it->second;
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +
> > +	return fd_retrace;
> > +}
> > +
> > +void remove_fd(int fd_trace)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	ctx_retrace.retrace_fds.erase(fd_trace);
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +void print_fds(void)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	if (ctx_retrace.retrace_fds.empty())
> > +		fprintf(stderr, "all devices closed\n");
> > +	for (auto it = ctx_retrace.retrace_fds.cbegin(); it != ctx_retrace.retrace_fds.cend(); ++it)
> > +		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", it->first, it->second);
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +void set_pixelformat_retrace(__u32 width, __u32 height, __u32 pixelformat)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	ctx_retrace.width = width;
> > +	ctx_retrace.height = height;
> > +	ctx_retrace.pixelformat = pixelformat;
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +}
> > +
> > +unsigned get_expected_length_retrace(void)
> > +{
> > +	pthread_mutex_lock(&ctx_retrace.lock);
> > +	unsigned width = ctx_retrace.width;
> > +	unsigned height = ctx_retrace.height;
> > +	unsigned pixelformat = ctx_retrace.pixelformat;
> > +	pthread_mutex_unlock(&ctx_retrace.lock);
> > +
> > +	unsigned expected_length = width * height;
> > +	if (pixelformat == V4L2_PIX_FMT_NV12 || pixelformat == V4L2_PIX_FMT_YUV420) {
> > +		expected_length *= 3;
> > +		expected_length /= 2;
> > +		expected_length += (expected_length % 2);
> > +	}
> > +	return expected_length;
> > +}
> > +
> > +void print_context(void)
> > +{
> > +	print_fds();
> > +	print_buffers_retrace();
> > +	fprintf(stderr, "\n");
> > +}
> 
> <snip>
> 
> > diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
> > new file mode 100644
> > index 00000000..6b4bf567
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/trace-helper.cpp
> > @@ -0,0 +1,816 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2022 Collabora Ltd.
> > + */
> > +
> > +#include <math.h> /* for pow */
> > +#include "v4l2-tracer-common.h"
> > +#include "trace-helper.h"
> > +#include "trace-info-gen.h"
> > +
> > +void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
> > +void trace_mem_encoded(int fd, __u32 offset);
> > +
> > +struct buffer_trace {
> > +	int fd;
> > +	__u32 type; /* enum v4l2_buf_type */
> > +	__u32 index;
> > +	__u32 offset;
> > +	__u32 bytesused;
> > +	long display_order;
> > +	unsigned long address;
> > +};
> > +
> > +struct trace_context {
> > +	__u32 width;
> > +	__u32 height;
> > +	FILE *trace_file;
> > +	__u32 pixelformat;
> > +	int pic_order_cnt_lsb;
> > +	int max_pic_order_cnt_lsb;
> > +	pthread_mutex_t lock;
> > +	__u32 compression_format;
> > +	std::string trace_filename;
> > +	int compressed_frame_count;
> > +	std::list<long> decode_order;
> > +	std::list<struct buffer_trace> buffers;
> > +	std::unordered_map<int, std::string> devices; /* key:fd, value: path of the device */
> > +};
> > +
> > +struct trace_options {
> > +	bool options_are_set;
> > +	bool verbose;
> > +	bool pretty_print_all;
> > +	bool pretty_print_mem;
> > +	bool write_decoded_data_to_yuv_file;
> > +	bool write_decoded_data_to_json_file;
> > +};
> > +
> > +std::string ver2s(unsigned int version)
> > +{
> > +	char buf[16];
> > +	sprintf(buf, "%d.%d.%d", version >> 16, (version >> 8) & 0xff, version & 0xff);
> > +	return buf;
> > +}
> > +
> > +std::string which2s(unsigned long which)
> > +{
> > +	std::string s = "unknown";
> > +
> > +	switch (which) {
> > +	case V4L2_CTRL_WHICH_CUR_VAL:
> > +		s = "V4L2_CTRL_WHICH_CUR_VAL";
> > +		break;
> > +	case V4L2_CTRL_WHICH_DEF_VAL:
> > +		s= "V4L2_CTRL_WHICH_DEF_VAL";
> > +		break;
> > +	case V4L2_CTRL_WHICH_REQUEST_VAL:
> > +		s = "V4L2_CTRL_WHICH_REQUEST_VAL";
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return s;
> > +}
> > +
> > +std::string val2s(unsigned long val, const definition *def)
> > +{
> > +	std::string s;
> > +
> > +	if (val == 0)
> > +		return s;
> > +
> > +	while ((def->val) && (def->val != val))
> > +		def++;
> > +
> > +	if (def->val == val)
> > +		s = def->str;
> > +
> > +	return s;
> > +}
> > +
> > +struct trace_options options;
> > +
> > +struct trace_context ctx_trace = {
> > +	.lock = PTHREAD_MUTEX_INITIALIZER
> > +};
> > +
> > +bool options_are_set(void)
> > +{
> > +	return options.options_are_set;
> > +}
> > +
> > +void set_options(void)
> > +{
> > +	options.verbose = getenv("TRACE_OPTION_VERBOSE") ? true : false;
> > +	options.pretty_print_mem = getenv("TRACE_OPTION_PRETTY_PRINT_MEM") ? true : false;
> > +	options.pretty_print_all = getenv("TRACE_OPTION_PRETTY_PRINT_ALL") ? true : false;
> > +	options.write_decoded_data_to_json_file = getenv("TRACE_OPTION_WRITE_DECODED_TO_JSON_FILE") ? true : false;
> > +	options.write_decoded_data_to_yuv_file = getenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE") ? true : false;
> > +	options.options_are_set = true;
> > +}
> > +
> > +bool option_is_set_verbose(void)
> > +{
> > +	return options.verbose;
> > +}
> > +
> > +bool option_is_set_pretty_print_mem(void)
> > +{
> > +	return options.pretty_print_mem;
> > +}
> > +
> > +bool option_is_set_write_decoded_data_to_json_file(void)
> > +{
> > +	return options.write_decoded_data_to_json_file;
> > +}
> > +
> > +bool is_video_or_media_device(const char *path)
> > +{
> > +	std::string dev_path_video = "/dev/video";
> > +	std::string dev_path_media = "/dev/media";
> > +	if (strncmp(path, dev_path_video.c_str(), dev_path_video.length()) &&
> > +	    strncmp(path, dev_path_media.c_str(), dev_path_media.length()))
> > +		return false;
> > +	return true;
> > +}
> > +
> > +void add_device(int fd, std::string path)
> > +{
> > +	std::pair<int, std::string> new_pair = std::make_pair(fd, path);
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.devices.insert(new_pair);
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +std::string get_device(int fd)
> > +{
> > +	std::string path;
> > +	std::unordered_map<int, std::string>::const_iterator it;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	it = ctx_trace.devices.find(fd);
> > +	if (it != ctx_trace.devices.end())
> > +		path = it->second;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return path;
> > +}
> > +
> > +int remove_device(int fd)
> > +{
> > +	int ret = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ret = ctx_trace.devices.erase(fd);
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return ret;
> > +}
> > +
> > +int count_devices(void)
> > +{
> > +	int count = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	count = ctx_trace.devices.size();
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return count;
> > +}
> > +
> > +void set_pixelformat_trace(__u32 width, __u32 height, __u32 pixelformat)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.width = width;
> > +	ctx_trace.height = height;
> > +	ctx_trace.pixelformat = pixelformat;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +__u32 get_pixelformat(void)
> > +{
> > +	__u32 pixelformat = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	pixelformat = ctx_trace.pixelformat;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return pixelformat;
> > +}
> > +
> > +void set_compression_format(__u32 compression_format)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.compression_format = compression_format;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +__u32 get_compression_format(void)
> > +{
> > +	__u32 compression_format = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	compression_format = ctx_trace.compression_format;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return compression_format;
> > +}
> > +
> > +void set_compressed_frame_count(int count)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.compressed_frame_count = count;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +int get_compressed_frame_count(void)
> > +{
> > +	int ret = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ret = ctx_trace.compressed_frame_count;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return ret;
> > +}
> > +
> > +void print_decode_order(void)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	fprintf(stderr, "Decode order: ");
> > +	for (auto &num : ctx_trace.decode_order)
> > +		fprintf(stderr, "%ld, ",  num);
> > +	fprintf(stderr, ".\n");
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +void set_decode_order(long decode_order)
> > +{
> > +	if (option_is_set_verbose())
> > +		fprintf(stderr, "%s: %ld\n", __func__, decode_order);
> > +
> > +	std::list<long>::iterator it;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
> > +	if (it == ctx_trace.decode_order.end())
> > +		ctx_trace.decode_order.push_front(decode_order);
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +
> > +	if (option_is_set_verbose())
> > +		print_decode_order();
> > +}
> > +
> > +long get_decode_order(void)
> > +{
> > +	long decode_order = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	if (!ctx_trace.decode_order.empty())
> > +		decode_order = ctx_trace.decode_order.front();
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return decode_order;
> > +}
> > +
> > +void set_max_pic_order_cnt_lsb(int max_pic_order_cnt_lsb)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.max_pic_order_cnt_lsb = max_pic_order_cnt_lsb;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +int get_max_pic_order_cnt_lsb(void)
> > +{
> > +	int max_pic_order_cnt_lsb = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	max_pic_order_cnt_lsb = ctx_trace.max_pic_order_cnt_lsb;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return max_pic_order_cnt_lsb;
> > +}
> > +
> > +void set_pic_order_cnt_lsb(int pic_order_cnt_lsb)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.pic_order_cnt_lsb = pic_order_cnt_lsb;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +int get_pic_order_cnt_lsb(void)
> > +{
> > +	int pic_order_cnt_lsb = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	pic_order_cnt_lsb = ctx_trace.pic_order_cnt_lsb;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return pic_order_cnt_lsb;
> > +}
> > +
> > +void add_buffer_trace(int fd, __u32 type, __u32 index, __u32 offset = 0)
> > +{
> > +	struct buffer_trace buf = {};
> > +	buf.fd = fd;
> > +	buf.type = type;
> > +	buf.index = index;
> > +	buf.offset = offset;
> > +	buf.display_order = -1;
> > +
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	ctx_trace.buffers.push_front(buf);
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +void remove_buffer_trace(int fd)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
> > +		if (it->fd == fd) {
> > +			ctx_trace.buffers.erase(it);
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +bool buffer_in_trace_context(int fd, __u32 offset)
> > +{
> > +	bool buffer_in_trace_context = false;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			buffer_in_trace_context = true;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return buffer_in_trace_context;
> > +}
> > +
> > +int get_buffer_fd_trace(__u32 type, __u32 index)
> > +{
> > +	int fd = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.type == type) && (b.index == index)) {
> > +			fd = b.fd;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return fd;
> > +}
> > +
> > +__u32 get_buffer_type_trace(int fd, __u32 offset)
> > +{
> > +	__u32 type = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			type = b.type;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return type;
> > +}
> > +
> > +int get_buffer_index_trace(int fd, __u32 offset)
> > +{
> > +	int index = -1;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			index = b.index;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return index;
> > +}
> > +
> > +__u32 get_buffer_offset_trace(__u32 type, __u32 index)
> > +{
> > +	__u32 offset = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.type == type) && (b.index == index)) {
> > +			offset = b.offset;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return offset;
> > +}
> > +
> > +void set_buffer_bytesused_trace(int fd, __u32 offset, __u32 bytesused)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			b.bytesused = bytesused;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +long get_buffer_bytesused_trace(int fd, __u32 offset)
> > +{
> > +	long bytesused = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			bytesused = b.bytesused;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return bytesused;
> > +}
> > +
> > +void set_buffer_display_order(int fd, __u32 offset, long display_order)
> > +{
> > +	if (option_is_set_verbose())
> > +		fprintf(stderr, "%s: %ld\n", __func__, display_order);
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			b.display_order = display_order;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +void set_buffer_address_trace(int fd, __u32 offset, unsigned long address)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			b.address = address;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +unsigned long get_buffer_address_trace(int fd, __u32 offset)
> > +{
> > +	unsigned long address = 0;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if ((b.fd == fd) && (b.offset == offset)) {
> > +			address = b.address;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return address;
> > +}
> > +
> > +bool buffer_is_mapped(unsigned long buffer_address)
> > +{
> > +	bool ret = false;
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		if (b.address == buffer_address) {
> > +			ret = true;
> > +			break;
> > +		}
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	return ret;
> > +}
> > +
> > +void print_buffers_trace(void)
> > +{
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	for (auto &b : ctx_trace.buffers) {
> > +		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
> > +		        b.fd, buftype2s(b.type).c_str(), b.index, b.display_order, b.bytesused);
> > +		fprintf(stderr, "address: %lu, offset: %u \n",  b.address, b.offset);
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +std::string get_ioctl_request_str(unsigned long request)
> > +{
> > +	__u8 ioctl_type = _IOC_TYPE(request);
> > +	switch (ioctl_type) {
> > +		case 'V': {
> > +			if (option_is_set_verbose())
> > +				fprintf(stderr, "%s\n", ioctl2s_video(request).c_str());
> > +			return ioctl2s_video(request);
> > +		}
> > +		case '|':
> > +			return ioctl2s_media(request);
> > +		case 'b':
> > +			if (request == DMA_BUF_IOCTL_SYNC)
> > +				return "DMA_BUF_IOCTL_SYNC";
> > +			break;
> > +		default:
> > +			break;
> > +	}
> > +	return "unknown ioctl";
> > +}
> > +
> > +unsigned get_expected_length_trace()
> > +{
> > +	unsigned width;
> > +	unsigned height;
> > +	unsigned pixelformat;
> > +	unsigned expected_length;
> > +
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	width = ctx_trace.width;
> > +	height = ctx_trace.height;
> > +	pixelformat = ctx_trace.pixelformat;
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +
> > +	/*
> > +	 * TODO: this assumes that the stride is equal to the real width and that the
> > +	 * padding follows the end of the chroma plane. It could be improved by
> > +	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
> > +	 */
> > +	expected_length = width * height;
> > +	if (pixelformat == V4L2_PIX_FMT_NV12 || pixelformat == V4L2_PIX_FMT_YUV420) {
> > +		expected_length *= 3;
> > +		expected_length /= 2;
> > +		expected_length += (expected_length % 2);
> > +	}
> > +	return expected_length;
> > +}
> > +
> > +void trace_mem_decoded(void)
> > +{
> > +	int displayed_count = 0;
> > +	unsigned expected_length = get_expected_length_trace();
> > +
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +
> > +	while (!ctx_trace.decode_order.empty()) {
> > +
> > +		std::list<buffer_trace>::iterator it;
> > +		long next_frame_to_be_displayed = *std::min_element(ctx_trace.decode_order.begin(),
> > +		                                                    ctx_trace.decode_order.end());
> > +
> > +		for (it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
> > +			if (it->display_order != next_frame_to_be_displayed)
> > +				continue;
> > +			if (!it->address)
> > +				break;
> > +			if (it->bytesused < expected_length)
> > +				break;
> > +			if (option_is_set_verbose())
> > +				fprintf(stderr, "%s, displaying: %ld, %s, index: %d\n",
> > +				        __func__, it->display_order, buftype2s(it->type).c_str(), it->index);
> > +			displayed_count++;
> > +
> > +			if (options.write_decoded_data_to_yuv_file) {
> > +				std::string filename = getenv("TRACE_ID");
> > +				filename +=  ".yuv";
> > +				FILE *fp = fopen(filename.c_str(), "a");
> > +				unsigned char *buffer_pointer = (unsigned char*) it->address;
> > +				for (__u32 i = 0; i < expected_length; i++)
> > +					fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
> > +				fclose(fp);
> > +			}
> > +			int fd = it->fd;
> > +			__u32 offset = it->offset;
> > +			__u32 type = it->type;
> > +			int index = it->index;
> > +			__u32 bytesused = it->bytesused;
> > +			unsigned long start = it->address;
> > +
> > +			pthread_mutex_unlock(&ctx_trace.lock);
> > +			trace_mem(fd, offset, type, index, bytesused, start);
> > +			pthread_mutex_lock(&ctx_trace.lock);
> > +
> > +			ctx_trace.decode_order.remove(next_frame_to_be_displayed);
> > +			it->display_order = -1;
> > +			break;
> > +		}
> > +		if (!it->address || it == ctx_trace.buffers.end() || it->bytesused < expected_length)
> > +			break;
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +	set_compressed_frame_count(get_compressed_frame_count() - displayed_count);
> > +}
> > +
> > +void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
> > +{
> > +	if (ext_controls->which != V4L2_CTRL_WHICH_REQUEST_VAL)
> > +		return;
> > +
> > +	if (option_is_set_verbose())
> > +		fprintf(stderr, "\n%s\n", __func__);
> > +
> > +	for (__u32 i = 0; i < ext_controls->count; i++) {
> > +		struct v4l2_ext_control ctrl = ext_controls->controls[i];
> > +
> > +		switch (ctrl.id) {
> 
> This could use some comments: why do you need to take special actions for these
> two controls?

Ok, I will add comments. A lot of this is about trying to get the frames to
display in the right order.

> 
> > +		case V4L2_CID_STATELESS_H264_SPS: {
> > +			set_max_pic_order_cnt_lsb(pow(2, ctrl.p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 + 4));
> > +			break;
> > +		}
> > +		case V4L2_CID_STATELESS_H264_DECODE_PARAMS: {
> > +			long pic_order_cnt_msb;
> > +			int max = get_max_pic_order_cnt_lsb();
> > +			long prev_pic_order_cnt_msb = get_decode_order();
> > +			int prev_pic_order_cnt_lsb = get_pic_order_cnt_lsb();
> > +			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
> > +
> > +			if (option_is_set_verbose()) {
> > +				fprintf(stderr, "\tprev_pic_order_cnt_lsb: %d\n", prev_pic_order_cnt_lsb);
> > +				fprintf(stderr, "\tprev_pic_order_cnt_msb: %ld\n", prev_pic_order_cnt_msb);
> > +				fprintf(stderr, "\tpic_order_cnt_lsb: %d\n", pic_order_cnt_lsb);
> > +			}
> > +
> > +			/* The first frame. */
> > +			if (prev_pic_order_cnt_msb == 0)
> > +				pic_order_cnt_msb = 0;
> > +
> > +			/*
> > +			 * TODO: improve the displaying of decoded frames following H264 specification
> > +			 * 8.2.1.1. For now, dump all the previously decoded frames when an IDR_PIC is
> > +			 * received to avoid losing frames although this will still sometimes result
> > +			 * in frames out of order.
> > +			 */
> > +			if (ctrl.p_h264_decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {
> > +				if (get_compressed_frame_count())
> > +					trace_mem_decoded();
> > +			}
> > +
> > +			/*
> > +			 * When pic_order_cnt_lsb wraps around to zero, adjust the total count using
> > +			 * max to keep the correct display order.
> > +			 */
> > +			if ((pic_order_cnt_lsb < prev_pic_order_cnt_lsb) &&
> > +				((prev_pic_order_cnt_lsb - pic_order_cnt_lsb) >= (max / 2))) {
> > +				pic_order_cnt_msb = prev_pic_order_cnt_msb + max;
> > +			} else if ((pic_order_cnt_lsb > prev_pic_order_cnt_lsb) &&
> > +				((pic_order_cnt_lsb - prev_pic_order_cnt_lsb) > (max / 2))) {
> > +				pic_order_cnt_msb = prev_pic_order_cnt_msb - max;
> > +			} else {
> > +				pic_order_cnt_msb = prev_pic_order_cnt_msb + (pic_order_cnt_lsb - prev_pic_order_cnt_lsb);
> > +			}
> > +
> > +			if (option_is_set_verbose())
> > +				fprintf(stderr, "\tpic_order_cnt_msb: %ld\n", pic_order_cnt_msb);
> > +
> > +			set_pic_order_cnt_lsb(pic_order_cnt_lsb);
> > +			set_decode_order(pic_order_cnt_msb);
> > +			break;
> > +		}
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> > +void qbuf_setup(struct v4l2_buffer *buf)
> > +{
> > +	if (option_is_set_verbose())
> > +		fprintf(stderr, "\n%s: %s, index: %d\n", __func__, buftype2s(buf->type).c_str(), buf->index);
> > +
> > +	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
> > +	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
> > +
> > +	__u32 bytesused = 0;
> > +	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
> > +	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > +		bytesused = buf->m.planes[0].bytesused;
> > +	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		bytesused = buf->bytesused;
> > +	set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
> > +
> > +	/* The output buffer should have compressed data just before it is queued, so trace it. */
> > +	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
> > +	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +		trace_mem_encoded(buf_fd, buf_offset);
> > +		set_compressed_frame_count(get_compressed_frame_count() + 1);
> > +	}
> > +
> > +	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
> > +	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +
> > +		/* If the capture buffer is queued for reuse, trace it before it is reused. */
> > +		if (get_compressed_frame_count())
> > +			trace_mem_decoded();
> > +
> > +		/* H264 sets display order in controls, otherwise display just in the order queued. */
> > +		if (get_compression_format() != V4L2_PIX_FMT_H264_SLICE)
> > +			set_decode_order(get_decode_order() + 1);
> > +
> > +		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
> > +
> > +		if (option_is_set_verbose()) {
> > +			print_decode_order();
> > +			print_buffers_trace();
> > +		}
> > +	}
> > +}
> > +
> > +void streamoff_cleanup(v4l2_buf_type buf_type)
> > +{
> > +	if (option_is_set_verbose()) {
> > +		fprintf(stderr, "\nVIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
> > +		fprintf(stderr, "compression: %s, pixelformat: %s %s, width: %d, height: %d\n",
> > +		        pixfmt2s(get_compression_format()).c_str(), pixfmt2s(get_pixelformat()).c_str(),
> > +		        fcc2s(get_pixelformat()).c_str(), ctx_trace.width, ctx_trace.height);
> > +	}
> > +
> > +	/*
> > +	 * Before turning off the stream, trace any remaining capture buffers that were missed
> > +	 * because they were not queued for reuse.
> > +	 */
> > +	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
> > +	    buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +		if (get_compressed_frame_count())
> > +			trace_mem_decoded();
> > +	}
> > +}
> > +
> > +void g_fmt_setup_trace(struct v4l2_format *format)
> > +{
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		set_pixelformat_trace(format->fmt.pix.width,
> > +		                      format->fmt.pix.height, format->fmt.pix.pixelformat);
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > +		set_pixelformat_trace(format->fmt.pix_mp.width, format->fmt.pix_mp.height,
> > +		                      format->fmt.pix_mp.pixelformat);
> > +
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		set_compression_format(format->fmt.pix.pixelformat);
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > +		set_compression_format(format->fmt.pix_mp.pixelformat);
> > +}
> > +
> > +void s_fmt_setup(struct v4l2_format *format)
> > +{
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		set_compression_format(format->fmt.pix.pixelformat);
> > +	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > +		set_compression_format(format->fmt.pix_mp.pixelformat);
> > +}
> > +
> > +void expbuf_setup(struct v4l2_exportbuffer *export_buffer)
> > +{
> > +	__u32 type = export_buffer->type;
> > +	__u32 index = export_buffer->index;
> > +	int fd_found_in_trace_context = get_buffer_fd_trace(type, index);
> > +
> > +	/* If the buffer was already added to the trace context don't add it again. */
> > +	if (fd_found_in_trace_context == export_buffer->fd)
> > +		return;
> > +
> > +	/*
> > +	 * If a buffer was previously added to the trace context using the video device
> > +	 * file descriptor, replace the video fd with the more specific buffer fd from EXPBUF.
> > +	 */
> > +	if (fd_found_in_trace_context)
> > +		remove_buffer_trace(fd_found_in_trace_context);
> > +
> > +	add_buffer_trace(export_buffer->fd, type, index);
> > +}
> > +
> > +void querybuf_setup(int fd, struct v4l2_buffer *buf)
> > +{
> > +	/* If the buffer was already added to the trace context don't add it again. */
> > +	if (get_buffer_fd_trace(buf->type, buf->index))
> > +		return;
> > +
> > +	switch (buf->memory) {
> > +	case V4L2_MEMORY_MMAP: {
> > +		__u32 offset = 0;
> > +		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
> > +		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT))
> > +			offset = buf->m.offset;
> > +		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
> > +		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> > +			offset = buf->m.planes->m.mem_offset;
> > +		add_buffer_trace(fd, buf->type, buf->index, offset);
> > +		break;
> > +	}
> > +	case V4L2_MEMORY_USERPTR:
> > +	case V4L2_MEMORY_DMABUF:
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +void write_json_object_to_json_file(json_object *jobj, int flags)
> > +{
> > +	if (options.pretty_print_all)
> > +		flags = JSON_C_TO_STRING_PRETTY;
> > +
> > +	std::string json_str = json_object_to_json_string_ext(jobj, flags);
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +
> > +	if (!ctx_trace.trace_file) {
> > +		ctx_trace.trace_filename = getenv("TRACE_ID");
> > +		ctx_trace.trace_filename += ".json";
> > +		ctx_trace.trace_file = fopen(ctx_trace.trace_filename.c_str(), "a");
> > +	}
> > +
> > +	fwrite(json_str.c_str(), sizeof(char), json_str.length(), ctx_trace.trace_file);
> > +	fputs(",\n", ctx_trace.trace_file);
> > +	fflush(ctx_trace.trace_file);
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> > +
> > +void close_json_file(void)
> > +{
> > +	pthread_mutex_lock(&ctx_trace.lock);
> > +	if (ctx_trace.trace_file) {
> > +		fclose(ctx_trace.trace_file);
> > +		ctx_trace.trace_file = 0;
> > +	}
> > +	pthread_mutex_unlock(&ctx_trace.lock);
> > +}
> 
> <snip>
> 
> > diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > new file mode 100755
> > index 00000000..ca17d7e2
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> > @@ -0,0 +1,359 @@
> > +#!/usr/bin/perl
> > +# SPDX-License-Identifier: GPL-2.0-only */
> > +# Copyright 2022 Collabora Ltd.
> 
> I am officially impressed! This is very nice work!

thanks :) perl is my friend now

> 
> > +
> > +sub convert_type_to_json_type {
> > +	my $type = shift;
> > +	if ($type eq __u8 || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32) {
> > +		return "int";
> > +	}
> > +	if ($type eq __u32) {
> > +		return "int64";
> > +	}
> > +	if ($type eq __u64) {
> > +		return "uint64";
> > +	}
> > +	if ($type eq struct) {
> > +		return;
> > +	}
> > +	print "v4l2_tracer: error: couldn't convert $type to json_object type.\n";
> > +	return;
> > +}
> > +
> > +sub get_index_letter {
> > +	my $index = shift;
> > +	if ($index eq 0) {return "i";}
> > +	if ($index eq 1) {return "j";}
> > +	if ($index eq 2) {return "k";}
> > +	if ($index eq 3) {return "l";}
> > +	if ($index eq 4) {return "m";}
> > +	if ($index eq 5) {return "n";}
> > +	if ($index eq 6) {return "o";} # "p" is saved for pointer
> > +	if ($index eq 8) {return "q";}
> > +	return "z";
> > +}
> > +
> > +$flag_func_name;
> > +
> > +sub flag_gen {
> > +	my $flag_type = shift;
> > +
> > +	if ($flag_type =~ /fwht/) {
> > +		$flag_func_name = v4l2_ctrl_fwht_params_;
> > +	} elsif ($flag_type =~ /vp8_loop_filter/) {
> > +		$flag_func_name = v4l2_vp8_loop_filter_;
> > +	} else {
> > +		($flag_func_name) = ($_) =~ /#define (\w+_)FLAG_.+/;
> > +		$flag_func_name = lc $flag_func_name;
> > +	}
> > +	printf $fh_trace_info_cpp "std::string %sflag2s(unsigned long flag)\n{\n", $flag_func_name;
> > +	printf $fh_trace_info_h "std::string %sflag2s(unsigned long flag);\n", $flag_func_name;
> > +	printf $fh_trace_info_cpp "\tstatic constexpr flag_def def[] = {\n";
> > +	($flag) = ($_) =~ /#define\s+(\w+)\s+.+/;
> > +	printf $fh_trace_info_cpp "\t\t{ $flag, \"$flag\" },\n";
> > +	while (<>) {
> > +		next if ($_ =~ /^\/?\s?\*.*/); #skip comments between flags if any
> > +		next if $_ =~ /^\s*$/; #skip blank lines between flags if any
> > +		last if ((grep {!/^#define\s+\w+_FL/} $_) && (grep {!/^#define V4L2_VP8_LF/} $_));
> > +		($flag) = ($_) =~ /#define\s+(\w+)\s+.+/;
> > +		printf $fh_trace_info_cpp "\t\t{ $flag, \"$flag\" },\n";
> > +	}
> > +	printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn flags2s(flag, def);\n}\n\n";
> > +}
> > +
> > +sub struct_gen {
> > +	($struct_name) = ($_) =~ /struct (\w+) {/;
> > +
> > +	printf $fh_trace_h "void trace_%s_gen(void *ptr, json_object *parent_obj);\n", $struct_name;
> > +	printf $fh_trace_cpp "void trace_%s_gen(void *ptr, json_object *parent_obj)\n{\n", $struct_name;
> > +	printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_object();\n", $struct_name;
> > +	printf $fh_trace_cpp "\tstruct %s *p = static_cast<struct %s*>(ptr);\n", $struct_name, $struct_name;
> > +
> > +	printf $fh_retrace_h "struct %s *retrace_%s_gen(json_object *ctrl_obj);\n", $struct_name, $struct_name;
> > +	printf $fh_retrace_cpp "struct %s *retrace_%s_gen(json_object *ctrl_obj)\n{\n", $struct_name, $struct_name;
> > +	printf $fh_retrace_cpp "\tstruct %s *p = (struct %s *) calloc(1, sizeof(%s));\n", $struct_name, $struct_name, $struct_name;
> > +	printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $struct_name;
> > +	# if a key value isn't found, assume it is retracing an element of an array
> > +	printf $fh_retrace_cpp "\tif (!json_object_object_get_ex(ctrl_obj, \"%s\", &%s_obj))\n", $struct_name, $struct_name;
> > +	printf $fh_retrace_cpp "\t\t%s_obj = ctrl_obj;\n", $struct_name;
> > +
> > +	while ($line = <> ) {
> > +		chomp($line);
> > +		last if $line =~ /};/;
> > +		next if $line =~ /^\s*$/;  # ignore blank lines
> > +		next if $line =~ /\/\*/; # ignore comment lines
> > +		$line =~ s/^\s+//; # remove leading whitespace
> > +		$line =~ s/;$//; # remove semi-colon at the end
> > +		my @words = split /[\s\[]/, $line; # also split on '[' to avoid arrays
> > +		@words = grep  {/^\D/} @words; # remove values that start with digit from inside []
> > +		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
> > +
> > +		($type) = $words[0];
> > +		$json_type = convert_type_to_json_type($type);
> > +
> > +		($member) = $words[scalar @words - 1];
> > +		next if $member =~ /reserved/; # ignore reserved members, they will segfault on retracing
> > +
> > +		# generate members that are arrays
> > +		if ($line =~ /.*\[.*/) {
> > +			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line; #trace comment
> > +			printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_array();\n", $member;
> > +
> > +			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line; #retrace comment
> > +
> > +			my @dimensions = ($line) =~ /\[(\w+)\]/g;
> > +			$dimensions_count = scalar @dimensions;
> > +
> > +			if ($dimensions_count > 1) {
> > +				printf $fh_retrace_cpp "\tint count_%s = 0;\n", $member;
> > +			}
> > +			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
> > +			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $member, $member;
> > +
> > +			for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
> > +				$size = $dimensions[$idx];
> > +				$index_letter = get_index_letter($idx);
> > +				printf $fh_trace_cpp "\t" x ($idx + 1);
> > +				printf $fh_trace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
> > +
> > +				printf $fh_retrace_cpp "\t" x ($idx + 1);
> > +				printf $fh_retrace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
> > +			}
> > +			printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
> > +			printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
> > +
> > +			# handle arrays of structs
> > +			if ($type =~ /struct/) {
> > +				my $struct_name_nested = @words[1];
> > +				printf $fh_trace_cpp "json_object *element_obj = json_object_new_object();\n";
> > +				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
> > +				printf $fh_trace_cpp "trace_%s_gen(&(p->%s", $struct_name_nested, $member;
> > +				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
> > +					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
> > +				}
> > +				printf $fh_trace_cpp "), element_obj);\n";
> > +				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
> > +				printf $fh_trace_cpp "json_object *element_no_key_obj;\n";
> > +				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
> > +				printf $fh_trace_cpp "json_object_object_get_ex(element_obj, \"%s\", &element_no_key_obj);\n", $struct_name_nested;
> > +				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
> > +				printf $fh_trace_cpp "json_object_array_add(%s_obj, element_no_key_obj);\n", $member;
> > +
> > +				printf $fh_retrace_cpp "p->%s", $member;
> > +				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
> > +					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
> > +				}
> > +				printf $fh_retrace_cpp " = *retrace_%s_gen(json_object_array_get_idx(%s_obj, ", $struct_name_nested, $member;
> > +				if ($dimensions_count > 1) {
> > +					printf $fh_retrace_cpp "count_%s++", $member;
> > +				} else {
> > +					printf $fh_retrace_cpp "i";
> > +				}
> > +				printf $fh_retrace_cpp "));\n";
> > +			} else {
> > +				printf $fh_trace_cpp "json_object_array_add(%s_obj, json_object_new_%s(p->%s", $member, $json_type, $member;
> > +				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
> > +					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
> > +				}
> > +				printf $fh_trace_cpp "));\n";
> > +
> > +				printf $fh_retrace_cpp "p->%s", $member;
> > +				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
> > +					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
> > +				}
> > +				printf $fh_retrace_cpp " = ($type) json_object_get_%s(json_object_array_get_idx(%s_obj, ", $json_type, $member;
> > +				if ($dimensions_count > 1) {
> > +					printf $fh_retrace_cpp "count_%s++", $member;
> > +				} else {
> > +					printf $fh_retrace_cpp "i";
> > +				}
> > +				printf $fh_retrace_cpp "));\n";
> > +			}
> > +			#closing brackets for all array types
> > +			for (my $idx = $dimensions_count - 1; $idx >= 0 ; $idx = $idx - 1) {
> > +				printf $fh_trace_cpp "\t" x ($idx + 1);
> > +				printf $fh_trace_cpp "}\n";
> > +
> > +				printf $fh_retrace_cpp "\t" x ($idx + 1);
> > +				printf $fh_retrace_cpp "}\n";
> > +			}
> > +			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", %s_obj);\n\n", $struct_name, $member, $member;
> > +		} elsif ($type =~ /struct/) {
> > +			# member that is a struct but not an array of structs
> > +			my $struct_name_nested = @words[1];
> > +			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line;
> > +			printf $fh_trace_cpp "\ttrace_%s_gen(&(p->%s), %s_obj);\n", $struct_name_nested, $member, $struct_name;
> > +
> > +			printf $fh_retrace_cpp "\t\/\* %s \*\/\n", $line;
> > +			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
> > +			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $struct_name_nested, $member;
> > +			printf $fh_retrace_cpp "\tp->%s = \*retrace_%s_gen(%s_obj);\n\n", $member, $struct_name_nested, $member;
> > +		} else {
> > +			# members that are integers
> > +			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", json_object_new_%s(p->%s));\n", $struct_name, $member, $json_type, $member;
> > +			printf $fh_retrace_cpp "\n\tjson_object *%s_obj;\n", $member;
> > +			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $member, $member;
> > +			printf $fh_retrace_cpp "\tp->%s = ($type) json_object_get_%s(%s_obj);\n", $member, $json_type, $member;
> > +
> > +			# add flag strings
> > +			if ($member =~ /^flags/) {
> > +				printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"flags_str\", json_object_new_string(%sflag2s(p->flags).c_str()));\n", $struct_name, $flag_func_name;
> > +			}
> > +		}
> > +	}
> > +	printf $fh_trace_cpp "\tjson_object_object_add(parent_obj, \"%s\", %s_obj);\n", $struct_name, $struct_name;
> > +	printf $fh_trace_cpp "}\n\n";
> > +
> > +	printf $fh_retrace_cpp "\n\treturn p;\n";
> > +	printf $fh_retrace_cpp "}\n\n";
> > +}
> > +
> > +open($fh_trace_cpp, '>', 'trace-gen.cpp') or die "Could not open trace-gen.cpp for writing";
> > +printf $fh_trace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_trace_cpp "#include \"v4l2-tracer-common.h\"\n#include \"trace-info-gen.h\"\n\n";
> > +
> > +open($fh_trace_h, '>', 'trace-gen.h') or die "Could not open trace-gen.h for writing";
> > +printf $fh_trace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_trace_h "\#ifndef TRACE_GEN_H\n";
> > +printf $fh_trace_h "\#define TRACE_GEN_H\n\n";
> > +
> > +open($fh_retrace_cpp, '>', 'retrace-gen.cpp') or die "Could not open retrace-gen.cpp for writing";
> > +printf $fh_retrace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_retrace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
> > +
> > +open($fh_retrace_h, '>', 'retrace-gen.h') or die "Could not open retrace-gen.h for writing";
> > +printf $fh_retrace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_retrace_h "\#ifndef RETRACE_GEN_H\n";
> > +printf $fh_retrace_h "\#define RETRACE_GEN_H\n\n";
> > +
> > +open($fh_trace_info_cpp, '>', 'trace-info-gen.cpp') or die "Could not open trace-info-gen.cpp for writing";
> > +printf $fh_trace_info_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_trace_info_cpp "#include \"v4l2-tracer-common.h\"\n#include \"trace-helper.h\"\n\n";
> > +
> > +open($fh_trace_info_h, '>', 'trace-info-gen.h') or die "Could not open trace-info-gen.h for writing";
> > +printf $fh_trace_info_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
> > +printf $fh_trace_info_h "\#ifndef TRACE_INFO_GEN_H\n";
> > +printf $fh_trace_info_h "\#define TRACE_INFO_GEN_H\n\n";
> > +
> > +$in_v4l2_controls = true;
> > +
> > +while (<>) {
> > +	if (grep {/#define __LINUX_VIDEODEV2_H/} $_) {$in_v4l2_controls = false;}
> > +
> > +	# only generate flag and struct functions for v4l2-controls.h
> > +	if ($in_v4l2_controls eq true) {
> > +		if (grep {/^#define.+_FLAG_.+/} $_) {
> > +			flag_gen();
> > +		} elsif (grep {/^#define.+FWHT_FL_.+/} $_) {
> > +			flag_gen("fwht");
> > +		} elsif (grep {/^#define V4L2_VP8_LF.*/} $_) {
> > +			flag_gen("vp8_loop_filter");
> > +		}
> > +
> > +		if (grep {/^struct/} $_) {
> > +			struct_gen();
> > +		}
> > +	}
> > +
> > +	if (grep {/^\/\* Control classes \*\//} $_) {
> > +		printf $fh_trace_info_cpp "std::string ctrlclass2s(__u32 id)\n{\n";
> > +		printf $fh_trace_info_h "std::string ctrlclass2s(__u32 id);\n";
> > +		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
> > +
> > +		while (<>) {
> > +			last if $_ =~ /^\s*$/; #last if blank line
> > +			($ctrl_class) = ($_) =~ /#define\s*(\w+)\s+.*/;
> > +			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ctrl_class, $ctrl_class;
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(id & 0xff0000, defs);\n}\n\n";
> > +	}
> > +
> > +	if (grep {/^enum v4l2_memory/} $_) {
> > +		printf $fh_trace_info_cpp "std::string v4l2_memory2s(__u32 val)\n{\n";
> > +		printf $fh_trace_info_h "std::string v4l2_memory2s(__u32 val);\n";
> > +		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
> > +
> > +		while (<>) {
> > +			last if $_ =~ /};/;
> > +			($memory_type) = ($_) =~ /\s*(\w+)\s+.*/;
> > +			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $memory_type, $memory_type;
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(val, defs);\n}\n\n";
> > +	}
> > +
> > +	if (grep {/\/\* Values for 'capabilities' field \*\//} $_) {
> > +		printf $fh_trace_info_cpp "std::string capabilities2s(unsigned long flag)\n{\n";
> > +		printf $fh_trace_info_h "std::string capabilities2s(unsigned long flag);\n";
> > +
> > +		printf $fh_trace_info_cpp "\tstatic constexpr flag_def def[] = {\n";
> > +		while (<>) {
> > +			last if $_ =~ /.*V I D E O   I M A G E   F O R M A T.*/;
> > +			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
> > +			next if $_ =~ /^\s*$/; #skip blank lines
> > +			($cap) = ($_) =~ /#define\s+(\w+)\s+.+/;
> > +			printf $fh_trace_info_cpp "\t\t{ $cap, \"$cap\" },\n"
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn flags2s(flag, def);\n}\n\n";
> > +	}
> > +
> > +	if (grep {/^enum v4l2_ctrl_type/} $_) {
> > +		printf $fh_trace_info_cpp "std::string ctrltype2s(__u32 val)\n{\n";
> > +		printf $fh_trace_info_h "std::string ctrltype2s(__u32 val);\n";
> > +		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
> > +
> > +		while (<>) {
> > +			next if ($_ =~ /^\s?\/?\s?\*.*/); #skip comments
> > +			next if $_ =~ /^\s*$/; #skip blank lines
> > +			last if $_ =~ /};/;
> > +			($ctrl_type) = ($_) =~ /\s*(\w+)\s+.*/;
> > +
> > +			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ctrl_type, $ctrl_type;
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(val, defs);\n}\n\n";
> > +	}
> > +
> > +	if (grep {/.*I O C T L   C O D E S   F O R   V I D E O   D E V I C E S.*/} $_) {
> > +		printf $fh_trace_info_cpp "std::string ioctl2s_video(unsigned long request)\n{\n";
> > +		printf $fh_trace_info_h "std::string ioctl2s_video(unsigned long request);\n";
> > +		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
> > +
> > +		while (<>) {
> > +			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
> > +			next if $_ =~ /^\s*$/; #skip blank lines
> > +			next if $_ =~ /^\s+/; #skip lines that start with a space
> > +			last if $_ =~ /^#define BASE_VIDIOC_PRIVATE/;
> > +			($ioctl_name) = ($_) =~ /^#define\s*(\w+)\s*/;
> > +			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ioctl_name, $ioctl_name;
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(request, defs);\n}\n\n";
> > +	}
> > +
> > +	# from media.h
> > +	if (grep {/\/\* ioctls \*\//} $_) {
> > +		printf $fh_trace_info_cpp "std::string ioctl2s_media(unsigned long request)\n{\n";
> > +		printf $fh_trace_info_h "std::string ioctl2s_media(unsigned long request);\n";
> > +		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
> > +
> > +		while (<>) {
> > +			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
> > +			next if $_ =~ /^\s*$/; #skip blank lines
> > +			next if $_ =~ /^\s+/; #skip lines that start with a space, comments
> > +			last if $_ =~ /^#define MEDIA_ENT_TYPE_SHIFT/;
> > +			($ioctl_name) = ($_) =~ /^#define\s*(\w+)\s*/;
> > +			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ioctl_name, $ioctl_name;
> > +		}
> > +		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(request, defs);\n}\n\n";
> > +	}
> > +}
> > +
> > +printf $fh_trace_h "\n#endif\n";
> > +close $fh_trace_h;
> > +close $fh_trace_cpp;
> > +
> > +printf $fh_retrace_h "\n#endif\n";
> > +close $fh_retrace_h;
> > +close $fh_retrace_cpp;
> > +
> > +printf $fh_trace_info_h "\n#endif\n";
> > +close $fh_trace_info_h;
> > +close $fh_trace_info_cpp;
> > diff --git a/utils/v4l2-tracer/v4l2-tracer.1.in b/utils/v4l2-tracer/v4l2-tracer.1.in
> > new file mode 100644
> > index 00000000..cd3d089b
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/v4l2-tracer.1.in
> > @@ -0,0 +1,104 @@
> > +.TH "V4L2-TRACER" "1" "October 2022" "v4l-utils @PACKAGE_VERSION@" "User Commands"
> > +.SH NAME
> > +v4l2-tracer - An application to trace and replay stateless video decoding.
> > +.SH SYNOPSIS
> > +\fBv4l2-tracer trace\fR [trace options] -- <\fItracee\fR>
> > +.RS
> > +.RE
> > +\fBv4l2-tracer retrace\fR [retrace options] -- <\fItrace_file\fR>\fB.json\fR
> > +.RS
> > +.RE
> > +
> > +.SH DESCRIPTION
> > +The v4l2-tracer utility traces, records and replays userspace applications
> > +that implement the v4l2 memory-to-memory stateless video decoder interface.
> > +The trace function intercepts and copies all system calls, stateless codec
> > +controls and encoded data to a json-formatted trace file. The retrace function
> > +independently reads and replays the json trace file. The json trace file can
> > +be retraced independently from its original userspace environment and can be
> > +edited to inject errors to test a driver's error handling abilities.
> > +
> > +.SH OPTIONS
> > +.SS Trace Options
> > +.TP
> > +\fB\-e\fR, \fB\-\-prettymem\fR
> > +Add whitespace in json file to improve readability of memory arrays.
> > +.TP
> > +\fB\-h\fR, \fB\-\-help\fR
> > +Display trace help.
> > +.TP
> > +\fB\-p\fR, \fB\-\-pretty\fR
> > +Add whitespace in json file to improve readability.
> > +.TP
> > +\fB\-r\fR, \fB\-\-raw\fR
> > +Write decoded data to json file.
> 
> This is a confusing option description. I assume you mean:
> 
> "Write the decoded video frame data to the json file."
> 
> "data" is just too vague.
> 
> > +.TP
> > +\fB\-v\fR, \fB\-\-verbose\fR
> > +Turn on verbose reporting.
> > +.TP
> > +\fB\-y\fR, \fB\-\-yuv\fR
> > +Write decoded data to yuv file.
> 
> Ditto.
> 
> Note that the same description is in the usage messages in the code.

ok, will change.

> 
> > +
> > +.SS Retrace Options
> > +.TP
> > +\fB\-d\fR, \fB\-\-device\fR <\fIdev\fR>
> > +Use a different video device than specified in the trace file.
> > +.RS
> > +<\fIdev\fR> must be a digit corresponding to an existing /dev/video<\fIdev\fR>
> > +.RE
> > +.TP
> > +\fB\-h\fR, \fB\-\-help\fR
> > +Display retrace help.
> > +.TP
> > +\fB\-m\fR, \fB\-\-media\fR <\fIdev\fR>
> > +Use a different media device than specified in the trace file.
> > +.RS
> > +<\fIdev\fR> must be a digit corresponding to an existing /dev/media<\fIdev\fR>
> > +.RE
> > +.TP
> > +\fB\-v\fR, \fB\-\-verbose\fR
> > +Turn on verbose reporting.
> > +
> > +.SH EXIT STATUS
> > +On success, it returns 0. Otherwise, it will return 1 or an error code.
> > +
> > +.SH EXAMPLES
> > +Trace VP8 decoding:
> > +.TP
> > +.EX
> > +	v4l2-tracer trace -- gst-launch-1.0 -- filesrc location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec ! videocodectestsink
> > +.EE
> > +.TP
> > +Trace H264 decoding:
> > +.TP
> > +.EX
> > +	v4l2-tracer trace -- gst-launch-1.0 -- filesrc location=test-25fps.h264 ! parsebin ! v4l2slh264dec ! videocodectestsink
> > +.EE
> > +.TP
> > +Trace FWHT decoding:
> > +.TP
> > +.EX
> > +	v4l2-tracer trace -- v4l2-ctl -d9 --stream-mmap --stream-out-mmap --stream-from-hdr test-25fps.fwht --stream-to out.yuv
> > +.EE
> > +.TP
> > +Retrace:
> > +.TP
> > +.EX
> > +	v4l2-tracer retrace 79568_trace.json
> > +.EE
> > +.TP
> > +Retrace using /dev/video6 and /dev/media3:
> > +.TP
> > +.EX
> > +	v4l2-tracer retrace -d 6 -m 3 79568_trace.json
> > +.EE
> > +.TP
> > +Self-trace:
> > +.TP
> > +.EX
> > +	v4l2-tracer trace -- v4l2-tracer retrace 79568_trace.json
> > +.EE
> > +
> > +.SH BUGS
> > +Bug reports or questions about this utility should be sent to the
> > +linux-media@vger.kernel.org mailinglist.
> > diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
> > new file mode 100644
> > index 00000000..71ac242a
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> > @@ -0,0 +1,187 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2022 Collabora Ltd.
> > + */
> > +
> > +#include <time.h>
> > +#include <dirent.h>
> > +#include <sys/wait.h>
> > +#include "v4l2-tracer-common.h"
> > +
> > +#define STR(x) #x
> > +#define STRING(x) STR(x)
> > +
> > +void print_help_retracer(void);
> > +int retracer(int argc, char *argv[]);
> > +
> > +enum Option_Tracer {
> > +    TracerOptPrettyPrintMemoryOnly = 'e',
> > +    TracerOptHelp = 'h',
> > +    TracerOptPrettyPrintAll = 'p',
> > +    TracerOptWriteDecodedToJsonFile = 'r',
> > +    TracerOptVerbose = 'v',
> > +    TracerOptWriteDecodedToYUVFile = 'y',
> > +};
> > +
> > +static struct option long_options_tracer[] = {
> > +	{ "prettymem", no_argument, nullptr, TracerOptPrettyPrintMemoryOnly },
> > +	{ "help", no_argument, nullptr, TracerOptHelp },
> > +	{ "pretty", no_argument, nullptr, TracerOptPrettyPrintAll },
> > +	{ "raw", no_argument, nullptr, TracerOptWriteDecodedToJsonFile },
> > +	{ "verbose", no_argument, nullptr, TracerOptVerbose },
> > +	{ "yuv", no_argument, nullptr, TracerOptWriteDecodedToYUVFile },
> > +	{ nullptr, 0, nullptr, 0 }
> > +};
> > +
> > +char short_options_tracer[] = {
> > +	TracerOptPrettyPrintMemoryOnly,
> > +	TracerOptHelp,
> > +	TracerOptPrettyPrintAll,
> > +	TracerOptWriteDecodedToJsonFile,
> > +	TracerOptVerbose,
> > +	TracerOptWriteDecodedToYUVFile
> > +};
> > +
> > +void print_help_tracer(void)
> > +{
> > +	fprintf(stderr, "v4l2-tracer trace [trace options] -- <tracee>\n"
> > +
> > +	        "\t-e, --prettymem   Add whitespace in json file to improve readability of memory arrays.\n"
> > +	        "\t-h, --help        Display trace help.\n"
> > +	        "\t-p, --pretty      Add whitespace in json file to improve readability.\n"
> > +	        "\t-r  --raw         Write decoded data to json file.\n"
> > +	        "\t-v, --verbose     Turn on verbose reporting.\n"
> > +	        "\t-y, --yuv         Write decoded data to yuv file.\n\n");
> > +}
> > +
> > +void print_usage(void)
> > +{
> > +	print_help_tracer();
> > +	print_help_retracer();
> > +}
> > +
> > +void get_options_trace(int argc, char *argv[])
> > +{
> > +	int ch;
> > +
> > +	do {
> > +		ch = getopt_long(argc, argv, short_options_tracer, long_options_tracer, NULL);
> > +		switch (ch){
> > +		case TracerOptPrettyPrintMemoryOnly:
> > +			setenv("TRACE_OPTION_PRETTY_PRINT_MEM", "true", 0);
> > +			break;
> > +		case TracerOptHelp:
> > +			break;
> > +		case TracerOptPrettyPrintAll:
> > +			setenv("TRACE_OPTION_PRETTY_PRINT_ALL", "true", 0);
> > +			break;
> > +		case TracerOptWriteDecodedToJsonFile:
> > +			setenv("TRACE_OPTION_WRITE_DECODED_TO_JSON_FILE", "true", 0);
> > +			break;
> > +		case TracerOptVerbose:
> > +			setenv("TRACE_OPTION_VERBOSE", "true", 0);
> > +			break;
> > +		case TracerOptWriteDecodedToYUVFile:
> > +			setenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE", "true", 0);
> > +			break;
> > +		}
> > +	} while (ch != -1);
> > +}
> > +
> > +int tracer(int argc, char *argv[])
> > +{
> > +	get_options_trace(argc, argv);
> > +
> > +	if (optind == argc) {
> > +		print_help_tracer();
> > +		return 1;
> > +	}
> > +
> > +	/* Get the application to be traced from the command line. */
> > +	int count = 0;
> > +	char *exec_array[argc];
> > +	while (optind < argc)
> > +		exec_array[count++] = argv[optind++];
> > +	exec_array[count] = nullptr;
> > +
> > +	/* Use a substring of the time to create a unique id for the trace. */
> > +	std::string trace_id = std::to_string(time(nullptr));
> > +	trace_id = trace_id.substr(5, trace_id.npos) + "_trace";
> > +	setenv("TRACE_ID", trace_id.c_str(), 0);
> > +
> > +	/* Create the trace file to hold the json-objects as a json array. */
> > +	std::string trace_filename = trace_id + ".json";
> > +	FILE *trace_file = fopen(trace_filename.c_str(), "w");
> > +	fputs("[\n", trace_file);
> > +	fclose(trace_file);
> > +
> > +	/*
> > +	 * Preload the libv4l2tracer library. If the program is installed, load the library
> > +	 * from its installed location, otherwise load it locally. If it's loaded locally,
> > +	 * use ./configure --disable-dyn-libv4l.
> > +	 */
> > +	std::string libv4l2tracer_path;
> > +	std::string program = argv[0];
> > +	std::size_t idx = program.rfind("/v4l2-tracer");
> > +	if (idx != program.npos) {
> > +		libv4l2tracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
> > +		DIR *dp = opendir(libv4l2tracer_path.c_str());
> > +		if (dp == nullptr)
> > +			libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
> > +		closedir(dp);
> > +	} else {
> > +		libv4l2tracer_path = STRING(LIBTRACER_PATH);
> > +	}
> > +	libv4l2tracer_path += "/libv4l2tracer.so";
> > +	fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
> > +	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
> > +
> > +	if (fork() == 0) {
> > +		execvpe(exec_array[0], exec_array, environ);
> > +		perror("Option -h for help.  Could not execute application to trace.");
> > +		return errno;
> > +	}
> > +
> > +	int tracee_result;
> > +	wait(&tracee_result);
> > +
> > +	if (WEXITSTATUS(tracee_result)) {
> > +		fprintf(stderr, "Trace error: %s\n", trace_filename.c_str());
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> > +	/* Close the json-array and the trace file. */
> > +	trace_file = fopen(trace_filename.c_str(), "a");
> > +	fseek(trace_file, 0L, SEEK_END);
> > +	fputs("\n]\n", trace_file);
> > +	fclose(trace_file);
> > +
> > +	fprintf(stderr, "Trace complete: ");
> > +	if (getenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE"))
> > +		fprintf(stderr, "%s, ", (trace_id + ".yuv").c_str());
> > +	fprintf(stderr, "%s", trace_filename.c_str());
> > +	fprintf(stderr, "\n");
> > +
> > +	return 0;
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	int ret = 1;
> > +
> > +	if (argc <= 1) {
> > +		print_usage();
> > +		return ret;
> > +	}
> > +
> > +	std::string command = argv[1];
> > +	optind = 2; /* start looking for options only after the trace/retrace command */
> > +	if (command == "trace")
> > +		ret = tracer(argc, argv);
> > +	else if (command == "retrace")
> > +		ret = retracer(argc, argv);
> > +	else
> > +		print_usage();
> > +
> > +	return ret;
> > +}
> 
> I have one more comment: I noticed that "mem_array" is output as:
> 
> "mem_array":[
>   "50a3 009d 012a 4001 f000 0007 0885 8588",
> 
> This is confusing since it is not clear if this is little or big endian.
> 
> Write it as:
> 
>   "50 a3 00 9d 01 2a 40 01 f0 00 00 07 08 85 85 88",

Hmm, from what i can tell it is always printed to string as big endian.
How does adding a space between each byte make it clear big/little?
But, maybe it would be best just to always dump it without spaces.
Since, truly this is not something I ever wanted to manually read.

> 
> You can make it depend on the --prettymem option. If set, then dump it
> with a space after each byte. If not set, then dump it in a compact format
> (no spaces at all): "50a3009d012a4001f000000708858588".
> 
> I think that's a good balance between compact and readable.
> 
> Regards,
> 
> 	Hans
