Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F59430A84
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343997AbhJQQWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237774AbhJQQWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:22:40 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14810C06161C;
        Sun, 17 Oct 2021 09:20:31 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 66so13521518pgc.9;
        Sun, 17 Oct 2021 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CHhOfH0KRWZKC+pRGevgzr4EThwrf4yJSV4LMymJI3E=;
        b=PTPURkgAss4fCr4JvEbcuprymKl/n58gm3lEV2cp0eAxBRMzVU07IyMB0/ePcu4QUU
         qPXMLBuyQblE67TilXg1p7mTyg57GKqPFeirjDxsTGGr74h0jCZL28d8UgwBhzz3pyMb
         BxQhlqngTvYMIgXQ+K7rVLjgyTsg0u4RCeA88uOIpDkt+dsps1cFD6R3m7q1wPFqT94Y
         j52xhwVn30uKwkSzXC+e7GLtRybLwk+MQ12Qw6UJC6ymDc4j+Dp3lmZsv9tQ314YT870
         M/pGBIOqkccDJMJ5W4bhJJFFBojXVX3WcAlcGn3vkA2bArWDBl8j31uDKs5desfpk2pX
         D5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CHhOfH0KRWZKC+pRGevgzr4EThwrf4yJSV4LMymJI3E=;
        b=4cqG8ho1ZmIt3ku3Ejdl4ZZE6Xo6xSZEt6WkVEha5Qs1kpp2RfVWbDojy/xjXP5Aqa
         dNEIlL2x4jmG6CcyAe+igyyz1FsvRG+aGBoJwpS7NdY8gz9Y02b5Eq04vyrYJAk6c8Bx
         1/wkrlVWXLyHT5Fz/0BdG72g3eb1ql7bU/418D7pkwa7k2BLqHSjHdjbpTm1q+gtp4UL
         c3iG8Pa0HGLFOynz5VN96i/oWlhmxHpnUnXdrH13EZ9poEOyu0ycBdqWHjt/WNk3Xy7B
         QabDDmmMwB4OzHpwAfeS3dJ/i3XOcBLc0c5AUcjbkcjmhZew6J3aj1/A3wnIaDaW8P6q
         lT6g==
X-Gm-Message-State: AOAM5321V1lXwPsxh++FS/WiuDvfcEml+TWQE4eljqvr7Pl949v1WFLa
        F5/KJ/CugBDe3yrFDiIV3Ps=
X-Google-Smtp-Source: ABdhPJyRkWtkCynUbiKGBQDZjD5qkPiKxwN9DXZ4ge9zd7OYaqc0My98HFh5eAtYyakn9GEv2cMtFA==
X-Received: by 2002:a63:7045:: with SMTP id a5mr18867632pgn.404.1634487630344;
        Sun, 17 Oct 2021 09:20:30 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:30 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/17] various fixes for atomisp to make it work
Date:   Mon, 18 Oct 2021 01:19:40 +0900
Message-Id: <20211017161958.44351-1-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This patch series contains fixes for atomisp to work (again). Tested on
Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
v5.15-rc5. Both are Cherry Trail (ISP2401) devices.

I'm still not used to Linux patch sending flow. Sorry in advance
if there is some weirdness :-) but I did my best.

I'll send another series that contains RFC patches later named ("bug
reports for atomisp to make it work"). To try to capture images, applying
those RFC patches are also needed.

The following 1st-7th patches are fixes for the upstreamed atomisp:

    media: atomisp: pci: add missing media_device_cleanup() in
      atomisp_unregister_entities()
    media: atomisp: pci: fix punit_ddr_dvfs_enable() argument for
      mrfld_power up case
    media: atomisp: pci: fix inverted logic in buffers_needed()
    media: atomisp: pci: do not use err var when checking port validity
      for ISP2400
    media: atomisp: pci: fix inverted error check for
      ia_css_mipi_is_source_port_valid()
    media: atomisp: pci: use IA_CSS_ERROR() for error messages in
      sh_css_mipi.c
    media: atomisp: pci: fix ifdefs in sh_css.c

The following 8th-13th patches partially reverts driver version back
to irci_stable_candrpv_0415_20150521_0458:

    media: atomisp: pci: make fw ver
      irci_stable_candrpv_0415_20150521_0458 work - 1/5
    media: atomisp: pci: make fw ver
      irci_stable_candrpv_0415_20150521_0458 work - 2/5
    media: atomisp: pci: make fw ver
      irci_stable_candrpv_0415_20150521_0458 work - 3/5
    media: atomisp: pci: make fw ver
      irci_stable_candrpv_0415_20150521_0458 work - 4/5
    media: atomisp: pci: make fw ver
      irci_stable_candrpv_0415_20150521_0458 work - 5/5
    media: atomisp: pci: release_version is now
      irci_stable_candrpv_0415_20150521_0458

One of the issues on the upstreamed atomisp is, the driver is a result
of the following two different versions of driver merged by tools using
`ifdef ISP2401`:

    - ISP2400: irci_stable_candrpv_0415_20150521_0458
    - ISP2401: irci_master_20150911_0724

and we don't have such firmware made for irci_master_20150911_0724.

I confirmed that the driver version irci_stable_candrpv_0415_20150521_0458
works well on the intel-aero version atomisp for ISP2401, too. Here is
my port, if someone is interested [2]:

So, eventually, such ISP version tests caused by just the driver version
difference can be removed (not just being unified but removed).

That said, it may take longer time until we remove such tests. So, for
now I thought it may be better to focus on just making atomisp work by
partially reverting the incompatible things for the firmware version
irci_stable_candrpv_0415_20150521_0458.

I added a little bit further note about ifdefs below.
Take a look at ("## about (a lot of) ISP2401 ifdef tests").

The following 14th patch is to remove the "trace_printk() being used"
kernel warning message:

    media: atomisp: pci: Remove remaining instance of call to trace_printk

The following 15th-16th patch adds ACPI variables to atomsip_gmin_platform
because surface3 does not describe the variables in DSDT or EFI.
I added the second patch marked as "[NOT-FOR-MERGE]" for a surface3 that
its DMI table is broken. I know this is just a HACK but included it anyway
just for the record.

    media: atomsip: pci: add Microsoft Surface 3 ACPI vars
    [NOT-FOR-MERGE] media: atomsip: pci: add DMI match for Microsoft
      Surface 3 with broken DMI (OEMB)

The following last patch is from Alan [1] about 4 years ago. I didn't
write this patch in any way but this patch is required for atomisp to
work normally. So, I added this just for convenience and reminder. If
possible, could someone look into this patch again?

    [NOT-FOR-MERGE] atomisp: Fix up the open v load race

[1] https://lore.kernel.org/linux-media/151001137594.77201.4306351721772580664.stgit@alans-desktop/
[2] You can try, but don't have to look into it; I'll try to describe
    what is needed in this mail:
    https://github.com/kitakar5525/linux-kernel/commits/mainline+aero_atomisp_wo_kapi_changes-2021-10-11



  ## taking a picture with atomisp

Note that to try to take a picture, please also apply at least the
this RFC patch ("[BUG][RFC] media: atomisp: pci: assume run_mode is
PREVIEW") I'll send as almost a BUG report later.

You need to use firmware version irci_stable_candrpv_0415_20150521_0458,
which is available from the intel-aero [1]

The atomisp (ipu2), like the ipu3, needs userspace support. The libcamera
has now decent ipu3 support but does not have atomisp support yet.

I found some userspace tools for atomisp that run on Linux:

  - capturev4l2 from intel-aero/sample-apps
    (https://github.com/intel-aero/sample-apps/tree/master/capturev4l2)
  - hd-camera from intel-aero/sample-apps
    (https://github.com/intel-aero/sample-apps/tree/master/hd-camera)
  - intel/nvt
    (https://github.com/intel/nvt)

It looks like the nvt is the most feature-rich, like exposure and white
balance. Note that current upstreamed atomisp dropped 32-bit support.
So, you need to build it with `-m64` (change it in Makefile). Here is
the example of usage I use on mipad2:

        $ ./v4l2n -o testimage_@.raw \
                --device /dev/video2 \
                --input 0 \
                --exposure=30000,30000,30000,30000 \
                --parm type=1,capturemode=CI_MODE_PREVIEW \
                --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
                --reqbufs count=2,memory=USERPTR \
                --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
                --capture=2 \

        ./raw2pnm -x1920 -y1080 -fNV12 testimage_001.raw testimage_001.pnm
        feh *.pnm # open the converted image
        rm testimage*

Note that I see the following warn/err after capture:

        kern  :warn  : [72660.793335] atomisp-isp2 0000:00:03.0: stop stream timeout.
        kern  :err   : [72660.973629] atomisp-isp2 0000:00:03.0: atomisp_reset

but I see the same message on the Android kernel, too. So, I think this
is not a real issue (I hope).

[1] https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto
    filename shisp_2401a0_v21.bin



  ## about (a lot of) ISP2401 ifdef tests

When porting intel-aero version atomisp to mainline, I thought almost
all the `ifdef ISP2401` things are the result of two different driver
version merged by tools.

To confirm that, I tried removing ifdefs for the initial commit of
upstreamed atomisp [1]. And I can successfully take a picture there on
surface3.

Currently, I can remove ifdefs up to commit bd674b5a413c ("media: atomisp:
cleanup ifdefs from ia_css_debug.c") [2] which is before 641c2292bf19 ("media:
atomisp: get rid of version-dependent globals"). Up to there, I stopped
and realized it may take some time to remove ifdefs for current atomisp.
So, instead of removing ifdefs, I partially reverted incompatible parts
in this series for now.

The ifdefs for the real hardware difference is like the following which
were removed or integrated into `ifdef ISP2401` on commit 641c2292bf19
("media: atomisp: get rid of version-dependent globals") and bd674b5a413c
("media: atomisp: cleanup ifdefs from ia_css_debug.c"):

  - HAS_NO_INPUT_FORMATTER
  - USE_INPUT_SYSTEM_VERSION_2
  - USE_INPUT_SYSTEM_VERSION_2401
  ...

I need to elaborate on this ifdef thing later (and I'll do later), but
for now, let's focus on make it just work...

[1] https://github.com/kitakar5525/linux-kernel/commits/mainline+upst_atomisp@a49d25364dfb_first
    Note that many of the commits are backports to make it build
    on the mainline; commits that remove ifdefs are in the 2nd page.
[2] https://github.com/kitakar5525/linux-kernel/commits/mainline+upst_atomisp@bd674b5a413c_before_get_rid_ver_globals

  ## for surface3 (and some crystal cove pmic based devices)

For devices which use intel_pmic_bytcrc driver, you need to add i2c
address. I sent RFC patch earlier named ("ACPI / PMIC: Add i2c address
to intel_pmic_bytcrc driver").

Also, sensor drivers are not upstream. Take a look at my working tree
if someone is interested [1].

I made world-facing camera (OV8835) work, which the driver is from the
old Android kernel tree. Unfortunately, the user-facing camera (AR0330)
is not working yet; the output is completely black. I'm not sure why,
maybe the sensor power issue (atomisp_gmin_platform) or sensor driver
issue, which the driver is from non-atomisp driver.

[1] https://github.com/kitakar5525/linux-kernel/commits/mainline+upst_atomisp

  ## for mipad2 (and whiskey cove pmic based devices)

For devices which equip whiskey cove PMIC, you need to add non-upstream
regulator driver [1].

[1] work done by jekhor, which seems to be from intel-aero or old
    Android kernel
    https://github.com/jekhor/yogabook-linux-kernel/commit/11c05b365fb2eeb4fced5aa66b362c511be32a34
    ("intel_soc_pmic_chtwc: Add regulator driver and definition for VPROG1B")

Regards,
Tsuchiya Yuto



Alan (1):
  [NOT-FOR-MERGE] atomisp: Fix up the open v load race

Tsuchiya Yuto (16):
  media: atomisp: pci: add missing media_device_cleanup() in
    atomisp_unregister_entities()
  media: atomisp: pci: fix punit_ddr_dvfs_enable() argument for
    mrfld_power up case
  media: atomisp: pci: fix inverted logic in buffers_needed()
  media: atomisp: pci: do not use err var when checking port validity
    for ISP2400
  media: atomisp: pci: fix inverted error check for
    ia_css_mipi_is_source_port_valid()
  media: atomisp: pci: use IA_CSS_ERROR() for error messages in
    sh_css_mipi.c
  media: atomisp: pci: fix ifdefs in sh_css.c
  media: atomisp: pci: make fw ver
    irci_stable_candrpv_0415_20150521_0458 work - 1/5
  media: atomisp: pci: make fw ver
    irci_stable_candrpv_0415_20150521_0458 work - 2/5
  media: atomisp: pci: make fw ver
    irci_stable_candrpv_0415_20150521_0458 work - 3/5
  media: atomisp: pci: make fw ver
    irci_stable_candrpv_0415_20150521_0458 work - 4/5
  media: atomisp: pci: make fw ver
    irci_stable_candrpv_0415_20150521_0458 work - 5/5
  media: atomisp: pci: release_version is now
    irci_stable_candrpv_0415_20150521_0458
  media: atomisp: pci: Remove remaining instance of call to trace_printk
  media: atomsip: pci: add Microsoft Surface 3 ACPI vars
  [NOT-FOR-MERGE] media: atomsip: pci: add DMI match for Microsoft
    Surface 3 with broken DMI (OEMB)

 .../media/atomisp/pci/atomisp_compat_css20.c  | 10 ---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 12 ++++
 .../media/atomisp/pci/atomisp_gmin_platform.c | 30 ++++++++
 .../media/atomisp/pci/atomisp_internal.h      |  5 ++
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 ++++--
 .../pci/camera/pipe/src/pipe_binarydesc.c     |  5 --
 .../css_2401_system/hive/ia_css_isp_params.c  | 23 -------
 .../media/atomisp/pci/ia_css_acc_types.h      |  5 --
 .../media/atomisp/pci/ia_css_isp_configs.h    |  8 ---
 .../media/atomisp/pci/ia_css_isp_params.h     |  3 -
 .../media/atomisp/pci/ia_css_pipe_public.h    |  3 -
 .../pci/isp/kernels/hdr/ia_css_hdr.host.c     |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr.host.h     |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_param.h    |  1 -
 .../pci/isp/kernels/hdr/ia_css_hdr_types.h    |  1 -
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.c    | 68 -------------------
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.h    | 33 ---------
 .../isp/kernels/sc/sc_1.0/ia_css_sc_types.h   | 14 ----
 .../atomisp/pci/isp2401_input_system_global.h | 12 ----
 .../runtime/binary/interface/ia_css_binary.h  |  1 -
 .../atomisp/pci/runtime/binary/src/binary.c   | 14 ----
 .../pci/runtime/isys/src/virtual_isys.c       | 11 ---
 drivers/staging/media/atomisp/pci/sh_css.c    | 31 +++------
 .../media/atomisp/pci/sh_css_firmware.c       | 16 +----
 .../media/atomisp/pci/sh_css_internal.h       |  8 ---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 67 +++++++++---------
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 22 ------
 27 files changed, 104 insertions(+), 320 deletions(-)

-- 
2.33.1

