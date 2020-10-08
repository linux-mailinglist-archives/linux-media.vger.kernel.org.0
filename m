Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29EB287527
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 15:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgJHNRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 09:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJHNRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 09:17:10 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B71C061755
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 06:17:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id b193so3372004pga.6
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=JR4zmw5j/8m9tCo1fjaeWbPWN28ZYMo/9NBc/vszuk4=;
        b=D1wVYgrOr4fSwdmnS5xUIIZflYHXV8SMzrnE7TBpdQy2Dp9OD9dYdH2D0ANxHe7vBF
         NgAE+hJhPhjmcXi8NoMhrGJcn4HaNm0sbuexAO91Tm5VE269bFFAudP9mZEzrMhtgvEm
         WnDhjQVEQJFwmrDcWCd0ADWCEbCOSktu4Nf0o9xuE1EF8PpMG1edJicKu7H2xqQP5uIv
         2AHYtLks2eMl002zvJzN1zCWFI5KFYbMt8OBUapq25gq41MziXYlBuQwcx+MNmZjXZFN
         Sh63KvMo4lTeazVtNba+G2GAMvVxqX9RkQHrZYEe4sd6GwXSVPU/41aI743z90Kl2dJw
         xS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=JR4zmw5j/8m9tCo1fjaeWbPWN28ZYMo/9NBc/vszuk4=;
        b=jrmhqrRzmi3D7N5tBS6i9pLx45U1avDGEa4gA6K0Hd61COMj+5Vk5zRsEgQNpf3I5m
         Z0tPapk003PD2tJ7z2PQzNpJCfm/9VOL1FQ/KtZrGOS+9MQaBqGqMXIvy4ifoyyci+e7
         LIqTXXRYSKICcGVnzbTEkpQNQOmcJrEjFtemZqZ9ePJCsAeSa9M5FZ+8q4Y0F1KaSy2I
         Bnd0hfAibVcUmg0tuDYRsCvF7JfZ/orGZ58k4FCaPVPZQCpe1bQqfypopmcC8Dk7Wt29
         dv0IvMqBajyoo+26VdP7AhiqKMksnN4u/fo53n1bUPCZyNA/DaNPkUfq6TUFOXXZI7p1
         Phnw==
X-Gm-Message-State: AOAM530sIHe2TR0MlHG+/Efl+mUMF/0WEmFQRPTSiqtZD6E8KLRJljCd
        ICWH/7LG+v0mQCA0GqfoXdw=
X-Google-Smtp-Source: ABdhPJz90WSQDuzp8MK5/KVkwYEwI+dWnPJnH/YqvGQPKqAMM6KEAYv8r3lGLRFqqpDAWmGIVPwH9A==
X-Received: by 2002:a65:62d5:: with SMTP id m21mr7341879pgv.226.1602163029576;
        Thu, 08 Oct 2020 06:17:09 -0700 (PDT)
Received: from [192.168.1.59] (i60-35-254-237.s41.a020.ap.plala.or.jp. [60.35.254.237])
        by smtp.gmail.com with ESMTPSA id v1sm7520468pjd.7.2020.10.08.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 06:17:08 -0700 (PDT)
Message-ID: <3667ce6d9323a9b313d161ea6800f9fb68809356.camel@gmail.com>
Subject: ipu3-cio2 causes hang on getting topology when
 GCC_PLUGIN_STRUCTLEAK_BYREF=y
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Thu, 08 Oct 2020 22:17:03 +0900
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, I'm one of the people who are trying to get ipu3 cameras working on
regular PCs that came with Windows OS.

I found that the ipu3-cio2 driver causes the kernel to hang on getting
device topology (like "media-ctl -p -d /dev/media0" or capturing images
with libcamera) when the kernel option "Initialize kernel stack variables
at function entry" is above "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=
=3Dy").

I noticed this issue because Arch Linux sets this option to "very strong"
("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy").

This issue happens even without sensor drivers or cio2-bridge driver
currently being developed [1]. So, I think this issue is reproducible
easily on regular PCs equipped with the IPU3 system as well.

The way the kernel crashes varies slightly from series to series:
- The latest stable (v5.8.y) and rc (v5.9-rcx)
  When this issue happened, the kernel just hangs. No journal log after
  the hang.
- The latest LTS (v5.4.y)
  When this issue happened, the kernel shows the following oops:

    BUG: stack guard page was hit at 00000000486e5acd (stack is 000000006e2=
c667d..0000000010408970)
    kernel stack overflow (double-fault): 0000 [#1] SMP PTI
    CPU: 2 PID: 2535 Comm: media-ctl Tainted: G         C        5.4.69-1-l=
ts #1
    Hardware name: Microsoft Corporation Surface Book/Surface Book, BIOS 92=
.3192.768 03.24.2020
    RIP: 0010:cio2_subdev_get_fmt+0x2c/0x180 [ipu3_cio2]

  I added the full oops at the bottom of this mail.

According to the description of the kernel option, it seems that the
uninitialized variables are used somewhere in the cio2_subdev_get_fmt()
[ipu3_cio2.c] ?

Steps to reproduce:
1. Build the kernel with the option set to
   "strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=3Dy") or
   "very strong" ("CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy").
2. Boot with the kernel and try to get the device topology by the command
   like the following:

    $ media-ctl -p -d /dev/media0

3. The kernel just hangs on the 5.8 and 5.9-rc, or prints the oops on 5.4

What I found so far:
I tried print debug like the following:

    1241 static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
    1242 			       struct v4l2_subdev_pad_config *cfg,
    1243 			       struct v4l2_subdev_format *fmt)
    1244 {
    1245 	struct cio2_queue *q =3D container_of(sd, struct cio2_queue, subd=
ev);
    1246 	struct v4l2_subdev_format format;
    1247 	int ret;
    1248=20
    1249 	pr_info("DEBUG: %s() called\n", __func__);
    1250 	pr_info("DEBUG: msleep()\n");
    1251 	msleep(1000);
    1252=20
    1253 	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
    1254 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
    1255 		fmt->format =3D *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
    1256 		return 0;
    1257 	}
    1258=20
    1259 	pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
    1260=20
    1261 	if (fmt->pad =3D=3D CIO2_PAD_SINK) {
    1262 		pr_info("DEBUG: Passed %s() %d\n", __func__, __LINE__);
    1263 		format.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
    1264 		ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL,
    1265 				       &format);

    $ media-ctl -p -d /dev/media0
    Media controller API version 5.9.0

    Media device information
    ------------------------
    driver          ipu3-cio2
    model           Intel IPU3 CIO2
    serial         =20
    bus info        PCI:0000:00:14.3
    hw revision     0x0
    driver version  5.9.0
   =20
    Device topology
    - entity 1: ipu3-csi2 0 (2 pads, 1 link)
                type V4L2 subdev subtype Unknown flags 0
                device node name /dev/v4l-subdev0
    	pad0: Sink
    # [output stopped here]

    $ dmesg -xw
    [  871.807563] kernel: DEBUG: cio2_subdev_get_fmt() called
    [  871.807566] kernel: DEBUG: msleep()
    [  872.821254] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
    [  872.821258] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
    # [...] (same output repeatedly)
    [  986.313536] kernel: DEBUG: cio2_subdev_get_fmt() called
    [  986.313538] kernel: DEBUG: msleep()
    [  987.326899] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1259
    [  987.326904] kernel: DEBUG: Passed cio2_subdev_get_fmt() 1262
    [  987.326908] kernel: DEBUG: cio2_subdev_get_fmt() called
    [  987.326910] kernel: DEBUG: msleep()
    (then, system hanged)

So, it looks like the following loop is happening there:
1. cio2_subdev_get_fmt() calls v4l2_subdev_call()
2. v4l2_subdev_call() internally calls cio2_subdev_get_fmt() again

Does anyone have any ideas what's happening?

Thanks,
Tsuchiya Yuto

[1] https://lore.kernel.org/linux-media/20201001093326.6208-1-djrscally@gma=
il.com/



Below is the dmesg log on v5.4.69:
$ media-ctl -p -d /dev/media0
Media controller API version 5.4.69

Media device information
------------------------
driver          ipu3-cio2
model           Intel IPU3 CIO2
serial         =20
bus info        PCI:0000:00:14.3
hw revision     0x0
driver version  5.4.69

Device topology
- entity 1: ipu3-csi2 0 (2 pads, 1 link)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
zsh: segmentation fault  media-ctl -p -d /dev/media0

$ dmesg -xw
kern  :emerg : [   40.860368] BUG: stack guard page was hit at 00000000486e=
5acd (stack is 000000006e2c667d..0000000010408970)
kern  :warn  : [   40.860373] kernel stack overflow (double-fault): 0000 [#=
1] SMP PTI
kern  :warn  : [   40.860375] CPU: 2 PID: 2535 Comm: media-ctl Tainted: G  =
       C        5.4.69-1-lts #1
kern  :warn  : [   40.860376] Hardware name: Microsoft Corporation Surface =
Book/Surface Book, BIOS 92.3192.768 03.24.2020
kern  :warn  : [   40.860381] RIP: 0010:cio2_subdev_get_fmt+0x2c/0x180 [ipu=
3_cio2]
kern  :warn  : [   40.860383] Code: 44 00 00 55 b9 0b 00 00 00 48 89 fd 53 =
48 89 d3 48 83 ec 60 65 48 8b 04 25 28 00 00 00 48 89 44 24 58 31 c0 48 89 =
e2 48 89 d7 <f3> 48 ab 8b 0b 8b 43 04 85 c9 0f 84 d3 00 00 00 85 c0 75 74 c=
7 04
kern  :warn  : [   40.860384] RSP: 0018:ffffad136c7f7fc0 EFLAGS: 00010246
kern  :warn  : [   40.860385] RAX: 0000000000000000 RBX: ffffad136c7f8038 R=
CX: 000000000000000b
kern  :warn  : [   40.860386] RDX: ffffad136c7f7fc0 RSI: 0000000000000000 R=
DI: ffffad136c7f7fc0
kern  :warn  : [   40.860387] RBP: ffff89e690e101f8 R08: 0000000000000000 R=
09: ffff89e5f7f306c0
kern  :warn  : [   40.860388] R10: 0000000000000000 R11: 0000000000000000 R=
12: 00000000c0585604
kern  :warn  : [   40.860389] R13: ffffad136c7fbdb8 R14: 0000000000000058 R=
15: ffffad136c7fbcc0
kern  :warn  : [   40.860392] FS:  00007f02d2447740(0000) GS:ffff89e69f3000=
00(0000) knlGS:0000000000000000
kern  :warn  : [   40.860393] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
kern  :warn  : [   40.860395] CR2: ffffad136c7f7fb8 CR3: 0000000426784001 C=
R4: 00000000003606e0
kern  :warn  : [   40.860396] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000
kern  :warn  : [   40.860397] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400
kern  :warn  : [   40.860398] Call Trace:
kern  :warn  : [   40.860404]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860407]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860409]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860411]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860412]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860414]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860416]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860419]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860421]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860423]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860426]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860429]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860431]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860434]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860436]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860439]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860441]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860444]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860447]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860449]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860452]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860455]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860458]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860460]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860463]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860466]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860469]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860471]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860474]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860476]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860478]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860481]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860483]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860486]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860489]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860492]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860494]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860497]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860499]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860502]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860505]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860508]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860511]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860514]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860517]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860519]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860522]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860524]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860527]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860530]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860532]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860535]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860538]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860541]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860544]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860547]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860550]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860553]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860556]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860559]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860561]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860563]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860565]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860567]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860568]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860570]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860573]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860576]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860579]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860582]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860584]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860587]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860590]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860592]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860595]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860597]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860599]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860602]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860604]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860607]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860609]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860612]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860614]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860617]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860619]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860621]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860624]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860626]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860628]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860631]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860633]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860636]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860638]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860641]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860643]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860645]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860648]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860650]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860653]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860656]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860658]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860661]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860664]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860666]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860668]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860671]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860673]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860676]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860679]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860681]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860684]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860686]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860688]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860690]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860693]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860695]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860697]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860700]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860702]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860705]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860708]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860711]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860713]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860716]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860719]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860722]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860725]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860728]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860731]  cio2_subdev_get_fmt+0x98/0x180 [ipu3_cio2]
kern  :warn  : [   40.860740]  subdev_do_ioctl+0x468/0xee0 [videodev]
kern  :warn  : [   40.860747]  video_usercopy+0xcb/0x620 [videodev]
kern  :warn  : [   40.860754]  ? subdev_do_ioctl+0xee0/0xee0 [videodev]
kern  :warn  : [   40.860760]  v4l2_ioctl+0x48/0x50 [videodev]
kern  :warn  : [   40.860772]  do_vfs_ioctl+0x3ed/0x6c0
kern  :warn  : [   40.860779]  ? kmem_cache_free+0xa4/0x1b0
kern  :warn  : [   40.860781]  ksys_ioctl+0x5e/0x90
kern  :warn  : [   40.860783]  __x64_sys_ioctl+0x16/0x20
kern  :warn  : [   40.860786]  do_syscall_64+0x49/0x90
kern  :warn  : [   40.860789]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kern  :warn  : [   40.860791] RIP: 0033:0x7f02d2562f6b
kern  :warn  : [   40.860793] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 =
b5 e8 1c ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 =
00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d5 ae 0c 00 f7 d8 64 89 0=
1 48
kern  :warn  : [   40.860794] RSP: 002b:00007ffee8c340b8 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000010
kern  :warn  : [   40.860797] RAX: ffffffffffffffda RBX: 000055c050cec010 R=
CX: 00007f02d2562f6b
kern  :warn  : [   40.860798] RDX: 00007ffee8c340c0 RSI: 00000000c0585604 R=
DI: 0000000000000003
kern  :warn  : [   40.860799] RBP: 00007ffee8c34170 R08: 00007f02d25f3040 R=
09: 00007f02d25f30c0
kern  :warn  : [   40.860800] R10: 0000000000000000 R11: 0000000000000246 R=
12: 0000000000000000
kern  :warn  : [   40.860801] R13: 0000000000000001 R14: 0000000000000001 R=
15: 000055c050cec018
kern  :warn  : [   40.860802] Modules linked in: rfcomm usb_storage cmac al=
gif_hash algif_skcipher af_alg bnep btusb btrtl btbcm btintel bluetooth ecd=
h_generic ecc zram msr input_leds joydev mousedev uinput intel_rapl_msr int=
el_rapl_common hid_sensor_gyro_3d hid_sensor_accel_3d hid_sensor_als hid_se=
nsor_rotation hid_sensor_trigger industrialio_triggered_buffer x86_pkg_temp=
_thermal intel_powerclamp kfifo_buf coretemp hid_sensor_iio_common industri=
alio snd_hda_codec_hdmi kvm_intel hid_multitouch hid_sensor_hub squashfs sn=
d_hda_codec_realtek kvm snd_hda_codec_generic ledtrig_audio irqbypass mei_h=
dcp crct10dif_pclmul crc32_pclmul snd_hda_intel hid_generic usbhid ghash_cl=
mulni_intel snd_intel_nhlt aesni_intel snd_hda_codec crypto_simd cryptd mwi=
fiex_pcie snd_hda_core nls_iso8859_1 glue_helper nls_cp437 rapl snd_hwdep i=
ntel_cstate mwifiex snd_pcm intel_uncore vfat fat snd_timer snd pcspkr fuse=
 loop soundcore cfg80211 ipu3_cio2 ipu3_imgu(C) rfkill v4l2_fwnode videobuf=
2_dma_sg videobuf2_memops videobuf2_v4l2 mei_me
kern  :warn  : [   40.860833]  videobuf2_common mei intel_lpss_pci intel_lp=
ss idma64 videodev i2c_hid intel_xhci_usb_role_switch roles intel_pch_therm=
al mc hid surfacepro3_button battery ac soc_button_array tpm_crb evdev mac_=
hid tpm_tis tpm_tis_core tpm rng_core pkcs8_key_parser sg scsi_mod crypto_u=
ser ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 xhci_pci crc3=
2c_intel xhci_hcd i915 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect =
sysimgblt fb_sys_fops drm intel_agp intel_gtt agpgart
kern  :warn  : [   40.860854] ---[ end trace a7f4222476a9faf1 ]---
kern  :warn  : [   40.860857] RIP: 0010:cio2_subdev_get_fmt+0x2c/0x180 [ipu=
3_cio2]
kern  :warn  : [   40.860859] Code: 44 00 00 55 b9 0b 00 00 00 48 89 fd 53 =
48 89 d3 48 83 ec 60 65 48 8b 04 25 28 00 00 00 48 89 44 24 58 31 c0 48 89 =
e2 48 89 d7 <f3> 48 ab 8b 0b 8b 43 04 85 c9 0f 84 d3 00 00 00 85 c0 75 74 c=
7 04
kern  :warn  : [   40.860860] RSP: 0018:ffffad136c7f7fc0 EFLAGS: 00010246
kern  :warn  : [   40.860861] RAX: 0000000000000000 RBX: ffffad136c7f8038 R=
CX: 000000000000000b
kern  :warn  : [   40.860862] RDX: ffffad136c7f7fc0 RSI: 0000000000000000 R=
DI: ffffad136c7f7fc0
kern  :warn  : [   40.860863] RBP: ffff89e690e101f8 R08: 0000000000000000 R=
09: ffff89e5f7f306c0
kern  :warn  : [   40.860865] R10: 0000000000000000 R11: 0000000000000000 R=
12: 00000000c0585604
kern  :warn  : [   40.860866] R13: ffffad136c7fbdb8 R14: 0000000000000058 R=
15: ffffad136c7fbcc0
kern  :warn  : [   40.860867] FS:  00007f02d2447740(0000) GS:ffff89e69f3000=
00(0000) knlGS:0000000000000000
kern  :warn  : [   40.860868] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
kern  :warn  : [   40.860870] CR2: ffffad136c7f7fb8 CR3: 0000000426784001 C=
R4: 00000000003606e0
kern  :warn  : [   40.860871] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000
kern  :warn  : [   40.860872] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400
kern  :warn  : [   40.860971] ------------[ cut here ]------------
kern  :warn  : [   40.860976] WARNING: CPU: 2 PID: 0 at kernel/rcu/tree.c:5=
69 rcu_idle_enter+0x80/0x90
kern  :warn  : [   40.860977] Modules linked in: rfcomm usb_storage cmac al=
gif_hash algif_skcipher af_alg bnep btusb btrtl btbcm btintel bluetooth ecd=
h_generic ecc zram msr input_leds joydev mousedev uinput intel_rapl_msr int=
el_rapl_common hid_sensor_gyro_3d hid_sensor_accel_3d hid_sensor_als hid_se=
nsor_rotation hid_sensor_trigger industrialio_triggered_buffer x86_pkg_temp=
_thermal intel_powerclamp kfifo_buf coretemp hid_sensor_iio_common industri=
alio snd_hda_codec_hdmi kvm_intel hid_multitouch hid_sensor_hub squashfs sn=
d_hda_codec_realtek kvm snd_hda_codec_generic ledtrig_audio irqbypass mei_h=
dcp crct10dif_pclmul crc32_pclmul snd_hda_intel hid_generic usbhid ghash_cl=
mulni_intel snd_intel_nhlt aesni_intel snd_hda_codec crypto_simd cryptd mwi=
fiex_pcie snd_hda_core nls_iso8859_1 glue_helper nls_cp437 rapl snd_hwdep i=
ntel_cstate mwifiex snd_pcm intel_uncore vfat fat snd_timer snd pcspkr fuse=
 loop soundcore cfg80211 ipu3_cio2 ipu3_imgu(C) rfkill v4l2_fwnode videobuf=
2_dma_sg videobuf2_memops videobuf2_v4l2 mei_me
kern  :warn  : [   40.861001]  videobuf2_common mei intel_lpss_pci intel_lp=
ss idma64 videodev i2c_hid intel_xhci_usb_role_switch roles intel_pch_therm=
al mc hid surfacepro3_button battery ac soc_button_array tpm_crb evdev mac_=
hid tpm_tis tpm_tis_core tpm rng_core pkcs8_key_parser sg scsi_mod crypto_u=
ser ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 xhci_pci crc3=
2c_intel xhci_hcd i915 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect =
sysimgblt fb_sys_fops drm intel_agp intel_gtt agpgart
kern  :warn  : [   40.861019] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G     =
 D  C        5.4.69-1-lts #1
kern  :warn  : [   40.861020] Hardware name: Microsoft Corporation Surface =
Book/Surface Book, BIOS 92.3192.768 03.24.2020
kern  :warn  : [   40.861022] RIP: 0010:rcu_idle_enter+0x80/0x90
kern  :warn  : [   40.861024] Code: d0 65 48 03 05 19 0c 30 57 48 c7 80 d0 =
00 00 00 00 00 00 00 65 48 03 15 06 0c 30 57 b8 02 00 00 00 f0 0f c1 82 e0 =
00 00 00 c3 <0f> 0b eb a6 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 00 0=
0 48
kern  :warn  : [   40.861025] RSP: 0018:ffffad13400c7ee0 EFLAGS: 00010002
kern  :warn  : [   40.861026] RAX: ffff89e69f32b300 RBX: ffff89e69cdc8000 R=
CX: 4000000000000000
kern  :warn  : [   40.861027] RDX: 000000000002b300 RSI: 0000000000000320 R=
DI: 000000000000014c
kern  :warn  : [   40.861028] RBP: 0000000000000002 R08: ffff89e69f3292e0 R=
09: 0000000000000018
kern  :warn  : [   40.861029] R10: 00000000000000be R11: ffff89e69f3292c0 R=
12: ffffffffa9ebbbe0
kern  :warn  : [   40.861030] R13: ffff89e69f334600 R14: 0000000000000004 R=
15: 0000000000000000
kern  :warn  : [   40.861032] FS:  0000000000000000(0000) GS:ffff89e69f3000=
00(0000) knlGS:0000000000000000
kern  :warn  : [   40.861033] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
kern  :warn  : [   40.861034] CR2: ffffad136c7f7fb8 CR3: 000000012680a002 C=
R4: 00000000003606e0
kern  :warn  : [   40.861035] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000
kern  :warn  : [   40.861036] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400
kern  :warn  : [   40.861037] Call Trace:
kern  :warn  : [   40.861042]  do_idle+0x1b6/0x240
kern  :warn  : [   40.861045]  cpu_startup_entry+0x19/0x20
kern  :warn  : [   40.861052]  start_secondary+0x176/0x1d0
kern  :warn  : [   40.861059]  secondary_startup_64+0xb6/0xc0
kern  :warn  : [   40.861062] ---[ end trace a7f4222476a9faf2 ]---


