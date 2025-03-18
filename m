Return-Path: <linux-media+bounces-28435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C46A67C2A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 19:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC63B3B6EC8
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 18:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A925F212D63;
	Tue, 18 Mar 2025 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vhd4931J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9E01AC892
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742323088; cv=none; b=MNH/yuAN9/UNP3qyUFVBQHuT4pATWjKnAIPZZ0Ntvzl8GOmvmZox1nHIJLklgbnly5A7JRDfiTNVq9AuwGHC0iHmdyFDELXy9qLul688geopwYe4dFZBox4w6em2Vbl/jcyBsiYtrZFbA8Spj+enGVuB264OM956lvXkkguTl9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742323088; c=relaxed/simple;
	bh=svw9EZxkPMxgX/rKP7N3fQy0RVcn8m9OHxj5oL/d/5g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ReIGbSnyGCA+1X3a9vSSFCsf5zM+Gh660nRRrJTf8mcVTabTZMGQrh4MNRlwZiRN4j62ArQsOKWxCL+Bo7saUvyYD3r/l8TaL/h06ULrDxR/DBG0IiNsfuxwPgwFxg3G4Idn3VTqu6LmvWIQ3N8RYC4BQeBofKyVoM1lCWFAPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vhd4931J; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e89a2501a0so57304036d6.1
        for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1742323084; x=1742927884; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=svw9EZxkPMxgX/rKP7N3fQy0RVcn8m9OHxj5oL/d/5g=;
        b=vhd4931JLa6jtzh/1OVMNs44iBjvaOg0coSvN6ZErsXxagbcIj7Y+/f5Us7udkIUAP
         LYGS/PBB+erCKWqUPK4Gz9sKXycwuocnlqtMjqovKG2bM8gyQhdxR9BDFQwHu9WpXVF0
         Au9U6eIY0NhvRaWvPPqnod38nD5nOCddZmiu+ZdOCaxUL7u7ysXpD5/ki4M5ZOW6VtQE
         OH0u1FQPeF44fXAlmFynJHZw0ZoSDSexoBPMb3guwZkF0cEZMf39LFpswC3yHXsR39i9
         5ozcOxhq/nwF6FKUD9xc8HmuUX/HfOHuXu9qfMqeYIaBSZJyQ/B/k4xvsDlBKdXL5N4Y
         w7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323084; x=1742927884;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svw9EZxkPMxgX/rKP7N3fQy0RVcn8m9OHxj5oL/d/5g=;
        b=st13bkMuL/se32jErDZZrSOxRiN1/01RyqXUD2QuZCReR+L2urXHE6IPOl6l0ut/c/
         ZyMc83YqRE7hFw0jvBiavs71Nf3sDwz3mDdPRJH7Q4vmHeovCmJkRzQvkNhR3GQ6rEBi
         5wJ9PrBEAnoASdF/74dHWHvE/86xBPrYE0OGmzpvx6rMGwbKlkI8zpePUu9464Af3mul
         GaF5SUJ/zOstmtjkidipjJh0vGJSDKj+zPo49mDcm68/ufWZr4UJK1asnVo0GqHZuVlX
         7fO050qHv3HqlLa5m39f+2/z35SzufwO6DDgibMLPnYILBzmaDYYlXe0dEW4Bskrm3Cd
         IUvw==
X-Forwarded-Encrypted: i=1; AJvYcCWXqvGquNEPkpg1TjM5vlpoYblDHZPFwk3s18PyqYcKGv9MVxcRwvQAwU3V8s5FP5HmC+eblbB3KB4aMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSo9OX9A3TGlDNXLONTLA+4PGPJcixpRojmkkUV88p5Ew+vdC
	Y66GSRuc7Qws1Yamqg2RA17v8OGYibIqLtGw7baIQ3Yc8TV/6gIFKthovakbyQ0=
X-Gm-Gg: ASbGncsrQ/RLHyjxgtlexR91IX+ywcA0Gn1dMEK6Gw4mZftxbbVN77GA7dckOx19OzI
	MnK/AwLDPn3JP9WtOfF4N/4EjXlQUoyFn2c2JBWMFnmwis2tTpbw5ooE/5nnz/fWo09GjiPXBmg
	qGP2YFDv5nnQs02iR6E7zArGJxmHqIHFZsN2QKK9mKCLEyfwe0QpZ1sK+Hz26kZ4LMUqHE5J3rn
	3Ic65LG+CfuXDr34eMhUS2z7PRpUJTMQqVEX8uRklSkgvmgYPNT5HZjFkADve4lBaIBvk3oTVN8
	JFMtLC5P+pISq96F3ylylmGA0KGtWev2zrM3SvBgzDuGoCPixxE0BNpZsuvy
X-Google-Smtp-Source: AGHT+IGEXSuirg5IH6jDcnHDxPpOBHvWvzrRtyQxaoORNWdCD434tke/m0zFLpwwUQj2zTPAHnCd5g==
X-Received: by 2002:ad4:5c65:0:b0:6e8:86d3:be73 with SMTP id 6a1803df08f44-6eaeaaeca0amr319184116d6.37.1742323084401;
        Tue, 18 Mar 2025 11:38:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade334d02sm70379456d6.80.2025.03.18.11.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:03 -0700 (PDT)
Message-ID: <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sumit Garg <sumit.garg@kernel.org>, Jens Wiklander
	 <jens.wiklander@linaro.org>
Cc: Daniel Stone <daniel@fooishbar.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Linux Kernel Mailing List	
 <linux-kernel@vger.kernel.org>, Linux Media Mailing List	
 <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
  "moderated list:DMA BUFFER SHARING FRAMEWORK"	
 <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olivier Masse
 <olivier.masse@nxp.com>, Thierry Reding	 <thierry.reding@gmail.com>, Yong
 Wu <yong.wu@mediatek.com>, Sumit Semwal	 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,  Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Date: Tue, 18 Mar 2025 14:38:02 -0400
In-Reply-To: <Z8avsigZJ4vqmiA4@sumit-X1>
References: 
	<CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
	 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
	 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
	 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
	 <20250214164856.0d2ead8a@collabora.com>
	 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
	 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
	 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
	 <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
	 <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
	 <Z8avsigZJ4vqmiA4@sumit-X1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 04 mars 2025 =C3=A0 13:15 +0530, Sumit Garg a =C3=A9crit=C2=A0:
> On Tue, Mar 04, 2025 at 08:17:23AM +0100, Jens Wiklander wrote:
> > Hi Daniel,
> >=20
> > On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote:
> > >=20
> > > Hi Sumit,
> > >=20
> > > On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wrot=
e:
> > > > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org> w=
rote:
> > > > > dma-heaps was created to solve the problem of having too many
> > > > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation w=
as
> > > > > painful and making it difficult for userspace to do what it neede=
d to
> > > > > do. Userspace doesn't _yet_ make full use of it, but the solution=
 is
> > > > > to make userspace make full use of it, not to go create entirely
> > > > > separate allocation paths for unclear reasons.
> > > > >=20
> > > > > Besides, I'm writing this from a platform that implements SVP not=
 via
> > > > > TEE. I've worked on platforms which implement SVP without any TEE=
,
> > > > > where the TEE implementation would be at best a no-op stub, and a=
t
> > > > > worst flat-out impossible.
> > > >=20
> > > > Can you elaborate the non-TEE use-case for Secure Video Path (SVP) =
a
> > > > bit more? As to how the protected/encrypted media content pipeline
> > > > works? Which architecture support does your use-case require? Is th=
ere
> > > > any higher privileged level firmware interaction required to perfor=
m
> > > > media content decryption into restricted memory? Do you plan to
> > > > upstream corresponding support in near future?
> > >=20
> > > You can see the MTK SVP patches on list which use the MTK SMC to medi=
ate it.
> > >=20
> > > There are TI Jacinto platforms which implement a 'secure' area
> > > configured statically by (IIRC) BL2, with static permissions defined
> > > for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> > > heard of another SoC vendor doing the same, but I don't think I can
> > > share those details. There is no TEE interaction.
> > >=20
> > > I'm writing this message from an AMD laptop which implements
> > > restricted content paths outside of TEE. I don't have the full pictur=
e
> > > of how SVP is implemented on AMD systems, but I do know that I don't
> > > have any TEE devices exposed.
> > >=20
> > > > Let me try to elaborate on the Secure Video Path (SVP) flow requiri=
ng
> > > > a TEE implementation (in general terms a higher privileged firmware
> > > > managing the pipeline as the kernel/user-space has no access
> > > > permissions to the plain text media content):
> > > >=20
> > > > - [...]
> > >=20
> > > Yeah, I totally understand the TEE usecase. I think that TEE is a goo=
d
> > > design to implement this. I think that TEE should be used for SVP
> > > where it makes sense.
> > >=20
> > > Please understand that I am _not_ arguing that no-one should use TEE =
for SVP!
> > >=20
> > > > > So, again, let's
> > > > > please turn this around: _why_ TEE? Who benefits from exposing th=
is as
> > > > > completely separate to the more generic uAPI that we specifically
> > > > > designed to handle things like this?
> > > >=20
> > > > The bridging between DMA heaps and TEE would still require user-spa=
ce
> > > > to perform an IOCTL into TEE to register the DMA-bufs as you can se=
e
> > > > here [1]. Then it will rather be two handles for user-space to mana=
ge.
> > >=20
> > > Yes, the decoder would need to do this. That's common though: if you
> > > want to share a buffer between V4L2 and DRM, you have three handles:
> > > the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use to
> > > bridge the two.
> > >=20
> > > > Similarly during restricted memory allocation/free we need another
> > > > glue layer under DMA heaps to TEE subsystem.
> > >=20
> > > Yep.
> > >=20
> > > > The reason is simply which has been iterated over many times in the
> > > > past threads that:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 "If user-space has to interact with a TEE device=
 for SVP use-case
> > > > then why it's not better to ask TEE to allocate restricted DMA-bufs
> > > > too"
> > >=20
> > > The first word in your proposition is load-bearing.
> > >=20
> > > Build out the usecase a little more here. You have a DRMed video
> > > stream coming in, which you need to decode (involving TEE for this
> > > usecase). You get a dmabuf handle to the decoded frame. You need to
> > > pass the dmabuf across to the Wayland compositor. The compositor need=
s
> > > to pass it to EGL/Vulkan to import and do composition, which in turn
> > > passes it to the GPU DRM driver. The output of the composition is in
> > > turn shared between the GPU DRM driver and the separate KMS DRM
> > > driver, with the involvement of GBM.
> > >=20
> > > For the platforms I'm interested in, the GPU DRM driver needs to
> > > switch into protected mode, which has no involvement at all with TEE =
-
> > > it's architecturally impossible to have TEE involved without moving
> > > most of the GPU driver into TEE and destroying performance. The
> > > display hardware also needs to engage protected mode, which again has
> > > no involvement with TEE and again would need to have half the driver
> > > moved into TEE for no benefit in order to do so. The Wayland
> > > compositor also has no interest in TEE: it tells the GPU DRM driver
> > > about the protected status of its buffers, and that's it.
> > >=20
> > > What these components _are_ opinionated about, is the way buffers are
> > > allocated and managed. We built out dmabuf modifiers for this usecase=
,
> > > and we have a good negotiation protocol around that. We also really
> > > care about buffer placement in some usecases - e.g. some display/code=
c
> > > hardware requires buffers to be sourced from contiguous memory, other
> > > hardware needs to know that when it shares buffers with another
> > > device, it needs to place the buffers outside of inaccessible/slow
> > > local RAM. So we built out dma-heaps, so every part of the component
> > > in the stack can communicate their buffer-placement needs in the same
> > > way as we do modifiers, and negotiate an acceptable allocation.
> > >=20
> > > That's my starting point for this discussion. We have a mechanism to
> > > deal with the fact that buffers need to be shared between different I=
P
> > > blocks which have their own constraints on buffer placement, avoiding
> > > the current problem of having every subsystem reinvent their own
> > > allocation uAPI which was burying us in impedance mismatch and
> > > confusion. That mechanism is dma-heaps. It seems like your starting
> > > point from this discussion is that you've implemented a TEE-centric
> > > design for SVP, and so all of userspace should bypass our existing
> > > cross-subsystem special-purpose allocation mechanism, and write
> > > specifically to one implementation. I believe that is a massive step
> > > backwards and an immediate introduction of technical debt.
> > >=20
> > > Again, having an implementation of SVP via TEE makes a huge amount of
> > > sense. Having _most_ SVP implementations via TEE still makes a lot of
> > > sense. Having _all_ SVP implementations eventually be via TEE would
> > > still make sense. But even if we were at that point - which we aren't
> > > - it still doesn't justify telling userspace 'use the generic dma-hea=
p
> > > uAPI for every device-specific allocation constraint, apart from SVP
> > > which has a completely different way to allocate some bytes'.
> >=20
> > I must admit that I don't see how this makes a significant difference,
> > but then I haven't hacked much in the stacks you're talking about, so
> > I'm going to take your word for it.
> >=20
> > I've experimented with providing a dma-heap replacing the TEE API. The
> > implementation is more complex than I first anticipated, adding about
> > 400 lines to the patch set.
>=20
> I did anticipated this but let's give it a try and see if DMA heaps
> really adds any value from user-space point of view. If it does then it
> will be worth the maintenence overhead.
>=20
> > From user space, it looks like another
> > dma-heap. I'm using the names you gave earlier,
> > protected,secure-video, protected,trusted-ui, and
> > protected,secure-video-record. However, I wonder if we shouldn't use
> > "restricted" instead of "protected" since we had agreed to call it
> > restricted memory earlier.
>=20
> Let's stick with "restricted" memory buffer references only.

Until now, we didn't have a standard to balance our naming choice, we
simply wanted to move away from "secure" which didn't mean much, and
restricted met our needs. I think the discussion is worth having again,
now that there is a standard that decided toward "protected". Matchcing
the Khronos standard means reducing a lot of confusion.

https://docs.vulkan.org/guide/latest/protected.html

regards,
Nicolas

