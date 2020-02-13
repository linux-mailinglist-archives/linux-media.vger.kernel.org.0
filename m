Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5EF15BA83
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 09:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgBMIIb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 03:08:31 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40919 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgBMIIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 03:08:30 -0500
Received: by mail-vk1-f194.google.com with SMTP id c129so1327795vkh.7;
        Thu, 13 Feb 2020 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=iVjFjg5HxxyUp0FTTCaY2ZaZze6N+bbzWn9c0SYYP0A=;
        b=SpHVCveQFmo1ZfYCy8bfUCWZQxxr5x+dF6K9VKR/GrcAKCulMZSf3YtyqtokqAD3Xn
         4+yJwULdn4iSUR7XdOMY2LGlsaF4YDtmZiddaF5jvPVso1lW0EN32UFYvOYac/5F/mkw
         XvRCq4cLu3mUphKb/vj7ZHzN36cZk4XaGwMO0zuZjIbH8VyAaVxxzAJwL07cyQ/jnB8B
         KXMPdM/bJY7ukwDQkLkJQLswRhhk4+UPmji0JADQx+K3bBoDLx4yyrWL19vcw5vKxVSr
         Qo1NA2oiL2T0lCAVJCd/FwescKI/59pzeEo/XxcNPM5fb0NwWHoNDFZrposEQ0a/J8J/
         oNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=iVjFjg5HxxyUp0FTTCaY2ZaZze6N+bbzWn9c0SYYP0A=;
        b=N0yl6vdI71sEZvh8S50NGE70UGbh26S1SqF+WVBhmKWusjPuqIJiBkpp8Cr0XZdTHv
         ELCuTFHIlfABQAD8o3V5wpdmygEZAkDoaI8g1My5lj4tY0iUcba9ZTgNdPLillMfcLFv
         IslXaoi0BZ2DIQDgBoWRCZRR2kkuFY/ULa8pJlcB7GxsOfBzsZsVzs798h5jhd88oxSv
         Dhwfpzya5UZBP1i39kuPQeVsyrfEDW5YwSn9EoHWR2UzEZpLp7xO49XSiufsTM2IBNQU
         jd3DR24SeIow+WbtAA/fok9CFp1IDb0PXPsoweJLoVOyvg2Ot9kufI1rvIB5n/S5gU9f
         q8UA==
X-Gm-Message-State: APjAAAVAC3Cie0ISEOoiI/v0iqHJrgezZWAGHIyyTQGA44LD1zNAuzGC
        hD5gu0K20qCOw2qm9UN9RPFW/rcxBZYhWe3NUXo3j5BS
X-Google-Smtp-Source: APXvYqzR6auKV1hfecowraKEK5ztIesGcFrbYqzt1rKwAHhDbe1yGWOojHGRdlUflDinGFItJcWpghAI25NhQ91oVc8=
X-Received: by 2002:ac5:c844:: with SMTP id g4mr1326979vkm.25.1581581309363;
 Thu, 13 Feb 2020 00:08:29 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?YmVyYXQgecSxbGTEsXo=?= <yildizberat@gmail.com>
Date:   Thu, 13 Feb 2020 11:08:18 +0300
Message-ID: <CAJjiCtufvtpgymRNUiTt_yDYdMabjL=3bOBzpX-sntM6fo7Org@mail.gmail.com>
Subject: i.MX8, ov5640_mipi_v3 module kernel and device tree problem (subdev null)
To:     linux-media@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I use i.MX8QXP embedded board.

My kernel version is : 4.19.35
Rootfs from yocto (warrior 4.19.35)

root@imx8qxpmek:/# uname -r
4.19.35-1.1.0+g0f9917c56d59

--------------------------------------------------------
I try to use OV5640 camera.
For that I use ov5640_mipi_v3 driver.
But I got module error. I believe that it related with device tree or kerne=
l.
Also I have to say for be suitable kernel with modules, I have to
append to local version with "-1.1.0"
---------------------------------------------------------

So my error log when I insmod ov5640_mipi_v3.ko module :
---------------------------------------------------------
root@imx8qxpmek:~# insmod ov5640_mipi_v3.ko
[ 60.292833] koda girdi
[ 60.292844] pin control
[ 60.295276] clock ayari
[ 60.297825] ov5640_mipi_v3 16-003c: 16-003c supply DOVDD not found,
using dummy regulator
[ 60.308687] ov5640_mipi_v3 16-003c: Linked as a consumer to regulator.0
[ 60.315387] ov5640_mipi_v3 16-003c: 16-003c supply DVDD not found,
using dummy regulator
[ 60.323624] ov5640_mipi_v3 16-003c: 16-003c supply AVDD not found,
using dummy regulator
[ 60.803638] Subdev's name =3D
[ 60.806536] Media_entitiy's name =3D (null)
[ 60.810595] line 214 graph_obj =3D null
[ 60.810605] entitiy line : 223
[ 60.815132] mx8-img-md: Registered sensor subdevice: ov5640_mipi_v3 16-003=
c (1)
[ 60.825558] entity line =3D 685, source pad =3D 12, sink_pad =3D 0
[ 60.825605] ------------[ cut here ]------------
[ 60.835880] kernel BUG at drivers/media/media-entity.c:158!
[ 60.841451] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[ 60.846940] Modules linked in: ov5640_mipi_v3(+)
[ 60.851563] Process insmod (pid: 4227, stack limit =3D 0x(____ptrval____))
[ 60.858273] CPU: 0 PID: 4227 Comm: insmod Not tainted
4.19.35-1.1.0+g0f9917c56d59 #5
[ 60.866017] Hardware name: TQ Systems i.MX8QXP TQMa8XQP (DT)
[ 60.871675] pstate: 40000005 (nZcv daif -PAN -UAO)
[ 60.876479] pc : media_gobj_create+0xec/0xf0
[ 60.880754] lr : media_create_pad_link+0x10c/0x1b8
[ 60.885546] sp : ffff000022013820
[ 60.888856] x29: ffff000022013820 x28: ffff80002907e858
[ 60.894173] x27: 00000000000002a0 x26: 0000000000000000
[ 60.899490] x25: 00000000fffffff4 x24: ffff80002446c180
[ 60.904806] x23: 0000000000000001 x22: 0000000000000000
[ 60.910123] x21: 000000000000000c x20: ffff80002907e998
[ 60.915440] x19: ffff80002907e858 x18: 0000000000000001
[ 60.920756] x17: 0000000000000001 x16: 0000000000000007
[ 60.926073] x15: ffffffffffffffff x14: ffff0000096b86c8
[ 60.931390] x13: ffff0000098a0c60 x12: ffff0000098a08af
[ 60.936707] x11: 0000000000000001 x10: ffff000022013820
[ 60.942024] x9 : ffff000022013820 x8 : 30203d206461705f
[ 60.947340] x7 : ffff00000989f000 x6 : 00000000000001b1
[ 60.952657] x5 : 0000000000000000 x4 : ffff80002bf310c0
[ 60.957974] x3 : ffff80002bf310c0 x2 : ffff80002446c180
[ 60.963290] x1 : 0000000000000002 x0 : 0000000000000000
[ 60.968607] Call trace:
[ 60.971052] media_gobj_create+0xec/0xf0
[ 60.974981] subdev_notifier_complete+0x98/0x660
[ 60.979602] v4l2_async_notifier_try_complete.part.3+0x44/0x60
[ 60.985439] v4l2_async_register_subdev+0xf8/0x1c0
[ 60.990241] ov5640_probe+0x580/0x5fc [ov5640_mipi_v3]
[ 60.995388] i2c_device_probe+0x264/0x2c0
[ 60.999401] really_probe+0x1c8/0x280
[ 61.003065] driver_probe_device+0x54/0xe8
[ 61.007165] __driver_attach+0xe4/0xe8
[ 61.010918] bus_for_each_dev+0x70/0xc0
[ 61.014758] driver_attach+0x20/0x28
[ 61.018337] bus_add_driver+0x1dc/0x208
[ 61.022178] driver_register+0x60/0x110
[ 61.026018] i2c_register_driver+0x44/0x88
[ 61.030121] ov5640_i2c_driver_init+0x20/0x1000 [ov5640_mipi_v3]
[ 61.036131] do_one_initcall+0x74/0x178
[ 61.039971] do_init_module+0x54/0x1c8
[ 61.043723] load_module+0x1bc0/0x2130
[ 61.047476] __se_sys_finit_module+0xb8/0xc8
[ 61.051750] __arm64_sys_finit_module+0x18/0x20
[ 61.056286] el0_svc_common+0x84/0xf0
[ 61.059951] el0_svc_handler+0x2c/0x80
[ 61.063703] el0_svc+0x8/0xc
[ 61.066581] Code: f9405001 91000421 f9005001 d65f03c0 (d4210000)
[ 61.072679] ---[ end trace bdbbcc0d3c6e70a0 ]---

Message from syslogd@imx8qxpmek at Tue Feb 11 17:59:18 2020 ...
imx8qxpmek kernel: [ 60.841451] Internal error: Oops - BUG: 0 [#1] PREEMPT =
SMP

Message from syslogd@imx8qxpmek at Tue Feb 11 17:59:18 2020 ...
imx8qxpmek kernel: [ 60.851563] Process insmod (pid: 4227, stack limit
=3D 0x(____ptrval____))

Message from syslogd@imx8qxpmek at Tue Feb 11 17:59:18 2020 ...
imx8qxpmek kernel: [ 61.066581] Code: f9405001 91000421 f9005001
d65f03c0 (d4210000)
Segmentation fault
root@imx8qxpmek:~#
---------------------------------------------------------------------------=
----
Because sensor->subdev seems NULL where ov5640_probe function.

ov5640_probe function in ov5640_mipi_v3.c =3D

---------------------------------------------
pr_warn("Subdev's name =3D %s\n",sd->name); -> empty
pr_warn("Media_entitiy's name =3D %s\n",sd->entity.name); -> NULL

v4l2_i2c_subdev_init(sd, client, &ov5640_subdev_ops);
---------------------------------------------
And bug is here :

media-entitiy.c function:


---------------------------------------------
void media_gobj_create(struct media_device *mdev,
enum media_gobj_type type,
struct media_gobj *gobj)
{
BUG_ON(!mdev);         // BUG POINT HERE
---------------------------------------------
I think somethings missing in my device tree. But I couldn't find.

My device tree :

---------------------------------------------
&isi_0 {
interface =3D <2 0 2>;
status =3D "okay";
};

&isi_1 {
status =3D "disabled";
};

&isi_2 {
status =3D "disabled";
};

&isi_3 {
status =3D "disabled";
};


&vpu {
status =3D "disabled";
};

&vpu_decoder {
core_type =3D <1>;
status =3D "okay";
};

&vpu_encoder {
core_type =3D <1>;
status =3D "okay";
};

&i2c0_csi0 {
#address-cells =3D <1>;
#size-cells =3D <0>;
pinctrl-names =3D "default";
pinctrl-0 =3D <&pinctrl_csi0_lpi2c0>;
clock-frequency =3D <100000>;
status =3D "okay";

ov5640_mipi: ov5640_mipi@3c {
compatible =3D "ovti,ov5640_mipi_v3";
reg =3D <0x3c>;
pinctrl-names =3D "default";
pinctrl-0 =3D <&pinctrl_mipi_csi0>;
clocks =3D <&clk IMX8QXP_CLK_DUMMY>;
clock-names =3D "csi_mclk";
csi_id =3D <0>;
pwn-gpios =3D <&gpio3 7 GPIO_ACTIVE_LOW>;
rst-gpios =3D <&gpio3 8 GPIO_ACTIVE_HIGH>;
mclk =3D <24000000>;
mclk_source =3D <0>;
mipi_csi;
status =3D "okay";
port {
ov5640_mipi_ep: endpoint {
remote-endpoint =3D <&mipi_csi0_ep>;
};
};
};


};

&mipi_csi_0 {
#address-cells =3D <1>;
#size-cells =3D <0>;
status =3D "okay";

port@0 {
reg =3D <0>;
mipi_csi0_ep: endpoint {
remote-endpoint =3D <&ov5640_mipi_ep>;
data-lanes =3D <0 1>;
};
};
};
---------------------------------------------
Really I need answers why I get this error?
If you need see something to see anything else please tell me.
I am waiting for any helps.

Thanks.

Berat Y=C4=B1ld=C4=B1z
