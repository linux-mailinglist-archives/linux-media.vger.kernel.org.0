Return-Path: <linux-media+bounces-42211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47BB51767
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F7B463186
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097C831DD96;
	Wed, 10 Sep 2025 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZMAYKbY4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3331CA51;
	Wed, 10 Sep 2025 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509015; cv=none; b=PiYUQw3WfFHzCPgGan+sMB/aNL6E5a+NFm/GbJQiFtZvbhbwgOm6AN/MosylJCR0YDn8+u8MRy2dAdsU/6XxCc2Wmzxav0islFMQLsetAUdwg7Q93TL4Zm5XOD2+RCCowx7FjP8vyfMrhRYmmP2QHFuKwjJIUAWdEwee80TFavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509015; c=relaxed/simple;
	bh=iMUWz4/QFqQcbdsH1zPcwbOsCaTP/l0YCH6dICosqSM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RZgYKONMEOeeMrQieh1helmDtfpqvElMfkX7HmkIH0ByLPftJsLB2ePVQkPSvTxeGy9WEP57vQ7ybKfyTb8Kr1gJjCucQpSO+FdoCA09aMzSmLeOtEqJBobuPNl8830I4b0O89wtRG+RzRPVL+nrI9iHwv1CLSR4lQ699Ry8CUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZMAYKbY4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757509010;
	bh=iMUWz4/QFqQcbdsH1zPcwbOsCaTP/l0YCH6dICosqSM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZMAYKbY4BvfQcb1JTMvQzCJoSq2KmErbW01lor64rBcZhEbW3VBQiazUtoPUiy0pi
	 hyBIrOL60xR1Pf+Jp2+k1TH+xpEPEbZPujTWUXrGb/Ov2PXwUhUJW3V7A7ddxj9Nea
	 EIkRf0vHJq62qs88lGJxR8LXzzM3xOj/wOZK/QJwMsl2Pv+ohxmi/4Zlzz5uTCiv+A
	 l+avCv3nFxbTeb5Czc/ID9G0/2g8o9gOK9NCQdG/tXyV8g+kpyL9fVVQu6FsIYnwuR
	 Zg5Ct4oQwJZPFOFgrUKtu+oFRXvJvQb7oR/a+pSJhd9Ub96Fo3kskA4D4O6nWouQFR
	 pf4K3tGGkIznQ==
Received: from [IPv6:2606:6d00:15:d961::5ac] (unknown [IPv6:2606:6d00:15:d961::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2299D17E1110;
	Wed, 10 Sep 2025 14:56:49 +0200 (CEST)
Message-ID: <c14c5a8b309ffcea723cee66430a59ee57b73e5f.camel@collabora.com>
Subject: Re: [PATCH v3 0/4] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Wed, 10 Sep 2025 08:56:46 -0400
In-Reply-To: <SLXP216MB11483F38D23A5BDFC47068EAED0EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
		 <f79ab2a0db0eb4aad20ed488de3635f9d8942cdf.camel@collabora.com>
		 <SLXP216MB114806E1937625CA3760CA3EED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
	 <48540d8ee22cf747d2dd591a7869baf1cba6719e.camel@collabora.com>
	 <SLXP216MB11483F38D23A5BDFC47068EAED0EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AjYjeHtaoSF3MHIAUJjI"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-AjYjeHtaoSF3MHIAUJjI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jackson,

Le mercredi 10 septembre 2025 =C3=A0 06:59 +0000, jackson.lee a =C3=A9crit=
=C2=A0:
[...]

> I have reproduced the stall problem, I can see it with the latest Gstream=
er version.
> The root cause is we checked an incorrect return value while flushing, so=
 in spite of not finished flushing, the checking loop if the flushing was f=
inished was exited.
> When stop streaming was called and the instance queue count was 1,=C2=A0 =
the checking function put infinite loop, so the stall problem happened.
>=20
> The below patch should be needed.
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index edbe69540ef1..2e0128cd0e4d 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -52,6 +52,7 @@ int wave5_vpu_init_with_bitcode(struct device *dev, u8 =
*bitcode, size_t size)
> =C2=A0int wave5_vpu_flush_instance(struct vpu_instance *inst)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int mutex_ret =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int retry =3D 0;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D mutex_lock_interruptib=
le(&inst->dev->hw_lock);
> @@ -80,9 +81,9 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_un=
lock(&inst->dev->hw_lock);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wave5_vp=
u_dec_get_output_info(inst, &dec_info);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D mutex_=
lock_interruptible(&inst->dev->hw_lock);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_ret =3D =
mutex_lock_interruptible(&inst->dev->hw_lock);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mutex_ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mutex_ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dec_=
info.index_frame_display > 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wave5_vpu_dec_set_disp_flag(inst, d=
ec_info.index_frame_display);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }

Good catch, unfortunately it does not completely fix the problem for me. Yo=
u can
find a the end of this message the patch I actually tested. Note I ,ove the
mutex_ret in a close scope, and fixed other occurence of this pattern, exce=
pt
one that I highlighted to you with a FIXME.

Some new information, I had this trace from GStreamer when the bug occured =
on forward seeks (very rare):

** (gst-play-1.0:604): WARNING **: 00:03:59.965: v4l2h264dec0: Too old fram=
es, bug in decoder -- please file a bug

[root@jacinto nicolas]# echo w > /proc/sysrq-trigger=20
[  335.116289] sysrq: Show Blocked State
[  335.120054] task:typefind:sink   state:D stack:0     pid:607   tgid:604 =
  ppid:543    task_flags:0x40044c flags:0x00000019
[  335.131147] Call trace:
[  335.133584]  __switch_to+0xf0/0x1c0 (T)
[  335.137442]  __schedule+0x35c/0x9bc
[  335.140935]  schedule+0x34/0x110
[  335.144162]  schedule_timeout+0x80/0x104
[  335.148081]  wait_for_completion_timeout+0x74/0x158
[  335.152955]  wave5_vpu_wait_interrupt+0x28/0x60 [wave5]
[  335.158252]  wave5_vpu_dec_stop_streaming+0x68/0x28c [wave5]
[  335.163915]  __vb2_queue_cancel+0x2c/0x2d4 [videobuf2_common]
[  335.169668]  vb2_core_queue_release+0x20/0x74 [videobuf2_common]
[  335.175678]  vb2_queue_release+0x10/0x1c [videobuf2_v4l2]
[  335.181081]  v4l2_m2m_ctx_release+0x20/0x40 [v4l2_mem2mem]
[  335.186567]  wave5_vpu_release_device+0x44/0x150 [wave5]
[  335.191879]  wave5_vpu_dec_release+0x20/0x2c [wave5]
[  335.196841]  v4l2_release+0xb4/0xf0 [videodev]
[  335.201709]  __fput+0xd0/0x2e0
[  335.205090]  ____fput+0x14/0x20
[  335.208468]  task_work_run+0x64/0xd4
[  335.212164]  do_exit+0x240/0x8e0
[  335.215552]  do_group_exit+0x30/0xa4
[  335.219177]  get_signal+0x790/0x860
[  335.222676]  do_signal+0x94/0x394
[  335.225986]  do_notify_resume+0xd0/0x14c
[  335.229910]  el0_svc+0xe4/0xe8
[  335.232967]  el0t_64_sync_handler+0xa0/0xe4
[  335.237154]  el0t_64_sync+0x198/0x19c

regards,
Nicolas

---

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/driv=
ers/media/platform/chips-media/wave5/wave5-vpuapi.c
index edbe69540ef1e..2faca2eee41fe 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -77,12 +77,13 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
                        return -ETIMEDOUT;
                } else if (ret =3D=3D -EBUSY) {
                        struct dec_output_info dec_info;
+                       int ret_mutex;
=20
                        mutex_unlock(&inst->dev->hw_lock);
                        wave5_vpu_dec_get_output_info(inst, &dec_info);
-                       ret =3D mutex_lock_interruptible(&inst->dev->hw_loc=
k);
-                       if (ret)
-                               return ret;
+                       ret_mutex =3D mutex_lock_interruptible(&inst->dev->=
hw_lock);
+                       if (ret_mutex)
+                               return ret_mutex;
                        if (dec_info.index_frame_display > 0)
                                wave5_vpu_dec_set_disp_flag(inst, dec_info.=
index_frame_display);
                }
@@ -222,6 +223,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 =
*fail_res)
        }
=20
        do {
+               int ret_mutex;
+
                ret =3D wave5_vpu_dec_finish_seq(inst, fail_res);
                if (ret < 0 && *fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNIN=
G) {
                        dev_warn(inst->dev->dev, "dec_finish_seq timed out\=
n");
@@ -243,10 +246,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
=20
                mutex_unlock(&vpu_dev->hw_lock);
                wave5_vpu_dec_get_output_info(inst, &dec_info);
-               ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
-               if (ret) {
+               ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
+               if (ret_mutex) {
                        pm_runtime_put_sync(inst->dev->dev);
-                       return ret;
+                       return ret_mutex;
                }
        } while (ret !=3D 0);
=20
@@ -482,6 +485,7 @@ dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance=
 *inst)
=20
        ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
        if (ret)
+               // FIXME this return type is wrong
                return ret;
=20
        rd_ptr =3D wave5_dec_get_rd_ptr(inst);
nicolas@whitebuilder:~/Sources/TI/jacinto/linux$ git diff
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/driv=
ers/media/platform/chips-media/wave5/wave5-vpuapi.c
index edbe69540ef1e..2faca2eee41fe 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -77,12 +77,13 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
                        return -ETIMEDOUT;
                } else if (ret =3D=3D -EBUSY) {
                        struct dec_output_info dec_info;
+                       int ret_mutex;
=20
                        mutex_unlock(&inst->dev->hw_lock);
                        wave5_vpu_dec_get_output_info(inst, &dec_info);
-                       ret =3D mutex_lock_interruptible(&inst->dev->hw_loc=
k);
-                       if (ret)
-                               return ret;
+                       ret_mutex =3D mutex_lock_interruptible(&inst->dev->=
hw_lock);
+                       if (ret_mutex)
+                               return ret_mutex;
                        if (dec_info.index_frame_display > 0)
                                wave5_vpu_dec_set_disp_flag(inst, dec_info.=
index_frame_display);
                }
@@ -222,6 +223,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 =
*fail_res)
        }
=20
        do {
+               int ret_mutex;
+
                ret =3D wave5_vpu_dec_finish_seq(inst, fail_res);
                if (ret < 0 && *fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNIN=
G) {
                        dev_warn(inst->dev->dev, "dec_finish_seq timed out\=
n");
@@ -243,10 +246,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
=20
                mutex_unlock(&vpu_dev->hw_lock);
                wave5_vpu_dec_get_output_info(inst, &dec_info);
-               ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
-               if (ret) {
+               ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
+               if (ret_mutex) {
                        pm_runtime_put_sync(inst->dev->dev);
-                       return ret;
+                       return ret_mutex;
                }
        } while (ret !=3D 0);
=20
@@ -482,6 +485,7 @@ dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance=
 *inst)
=20
        ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
        if (ret)
+               // FIXME this return type is wrong
                return ret;
=20
        rd_ptr =3D wave5_dec_get_rd_ptr(inst);

--=-AjYjeHtaoSF3MHIAUJjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMF1jgAKCRDZQZRRKWBy
9EnIAP9AOn0oiF+WTit9olIDp4XylQGbivLhSbjKsNLkioIK7gEAvmOBUtXEiZe4
TRnJnACn7fa0XYJYdSgRItWLj/Xxag0=
=4PHM
-----END PGP SIGNATURE-----

--=-AjYjeHtaoSF3MHIAUJjI--

