Return-Path: <linux-media+bounces-28462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9557A685DC
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 08:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062954228EF
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 07:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF98214A8B;
	Wed, 19 Mar 2025 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN212hBS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A9212D6A
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742369872; cv=none; b=numexWR//CwEhuYn5EdPuoXvxEDlyPIvjusEWv5UtzQR705KtUmoAYTJcUhMhwGwhPRs98Rwd6Pvq00PWkqwkQVcaif+HbfCYEC7twGgI+l6SFrVxrgXMJZLJXNuhWv634kO+eBw2m5/xPBSHSz7rKTybiu0Ow8LjJGKgmKol80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742369872; c=relaxed/simple;
	bh=ixMTS/Arg4oWBuKoea1pswZg9PN1FnAdtKOX3ezXavo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXWcner3PEq3BCErjlOcTgQNKqbNJ/dUoCYD5jaWkpAHAJwcHJDiEZFqG7XEZwZ7P5j2lIc522e1zgASqkeJmzL0rXL/SXs5fZbG8QnUS1oDfxBOr6YAsrhnKZb9SHwgMixlcKgdfGfqG3TmxIObgAlcZZETohz+YCC6RjMuiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN212hBS; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2bcceee7b41so2210810fac.2
        for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742369870; x=1742974670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
        b=zN212hBSv4hvHIzxBW6flqD/xPHWZrklx38b2IyASXm49YCJwW9dPY36x8P8zMArMu
         JOAvGeH08BAoH0fHL6PBCFfLE8ZOa4DRYiU6FOR9/+d+yH7ZbZDD5mEyWwSdaopT2GKZ
         YyuAX8DGaSoPgkfglkUf97+77kO98E9yYd3BxIgkK6tjRWO0SiAvjXaA+pt5UDIz1n9B
         HpIIFw5YEWjrV+cGTq9YEF8m3iwoHFbEvut6gPlgl4P1l0juoNIzmDKmifsZNjDnlT8Q
         gMhCUNY5wCNRFvyyeyi7MVj6Hq9Jz4cA1hh44UW7M/ye0zUThGpz34ZB5DnF3nmfd6FU
         0KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742369870; x=1742974670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
        b=eRpMr7GsQmYTo6YuKD4si3rSkKmQ1usXoXYgQCjS7yBEvK6woc1yLsy74Zjth0jeri
         KPwfDbG7HL2/W/gh7l3fcSNXEitDdhddQWjoFq/5WtrtyXaiU342zKC7s3s16+9k6QKn
         p0KuzhLVQXK0Prd+yur4iATWnbIKcRgTRwn9RTCGwrhQthNQzdrkSzXozJnQsuO/nG83
         Mgaqbse9SGNB4USt2VbuQWe083cDRwKkR1MDLwFdk+AAmvfktuTncwUCOuNoK43YCJkF
         FtAOd5ltUZUrlKlMaFouL6TI0PjL8gRfHcaRkUKezlvOYnC31nH+2q0qoH1+6GHdhIxX
         1WtA==
X-Forwarded-Encrypted: i=1; AJvYcCUAjJ8Cs0dgI1gMPC13qITu/1fdIz3r6mBzQm8o4xML6s4AXEE+4ktLqnq3zA9OLnZjgSuIC3UQVuNA7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIafRieGRFO6CB/pJQnonSmRNz1TqWtAQN4TpyQ5XMNjwHC0cv
	uPsp5KxjdUtaKGju78K5pS98h5+JYY7fPWnJsZpL6oHMBQFbAliV10ImD5faN18KDymbc8cU3YS
	0ClX9PAPKwW7k612BK2tPhrNPYzn9RFrX048IOw==
X-Gm-Gg: ASbGncvsP46YRRJ8rHFz7amazr/mmpzRINvIUMw+BHO9/f5h1oB85R4WTrqhvOj7LMV
	WXkOjiUvFCNI7fFo30/dfI0LTIHFrvUJvqcxfvF1p9gSxhMv7k7Sd2AUffE+wnuWnbwIkTqJxBV
	3vOJDpNi3jOvCccF4YEhB44XjbU2Q=
X-Google-Smtp-Source: AGHT+IHhlr0ebpnI7ur3lSLDToxyweC0Ao9NnSXnP3sZR4rKFcxyBq8t5/yasVPUDL7hE6LOxReMuAl1+DoeTa0xu40=
X-Received: by 2002:a05:6871:710:b0:29e:290f:7aea with SMTP id
 586e51a60fabf-2c745785fb8mr1233815fac.34.1742369869734; Wed, 19 Mar 2025
 00:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com> <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
 <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
 <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
 <Z8avsigZJ4vqmiA4@sumit-X1> <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
In-Reply-To: <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Mar 2025 08:37:38 +0100
X-Gm-Features: AQ5f1JoBpDEcbO9dlVRTjtWYtOyjNLGsFkNPj_PW0jLG2Dag8-4LN8wDdyWmUJE
Message-ID: <CAHUa44E11jYFrAFrZmNVTpLJ-XDs45QyTr-_DbeWBOQ0DjHPkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sumit Garg <sumit.garg@kernel.org>, Daniel Stone <daniel@fooishbar.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 18, 2025 at 7:38=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 04 mars 2025 =C3=A0 13:15 +0530, Sumit Garg a =C3=A9crit :
> > On Tue, Mar 04, 2025 at 08:17:23AM +0100, Jens Wiklander wrote:
> > > Hi Daniel,
> > >
> > > On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi Sumit,
> > > >
> > > > On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wr=
ote:
> > > > > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org>=
 wrote:
> > > > > > dma-heaps was created to solve the problem of having too many
> > > > > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation=
 was
> > > > > > painful and making it difficult for userspace to do what it nee=
ded to
> > > > > > do. Userspace doesn't _yet_ make full use of it, but the soluti=
on is
> > > > > > to make userspace make full use of it, not to go create entirel=
y
> > > > > > separate allocation paths for unclear reasons.
> > > > > >
> > > > > > Besides, I'm writing this from a platform that implements SVP n=
ot via
> > > > > > TEE. I've worked on platforms which implement SVP without any T=
EE,
> > > > > > where the TEE implementation would be at best a no-op stub, and=
 at
> > > > > > worst flat-out impossible.
> > > > >
> > > > > Can you elaborate the non-TEE use-case for Secure Video Path (SVP=
) a
> > > > > bit more? As to how the protected/encrypted media content pipelin=
e
> > > > > works? Which architecture support does your use-case require? Is =
there
> > > > > any higher privileged level firmware interaction required to perf=
orm
> > > > > media content decryption into restricted memory? Do you plan to
> > > > > upstream corresponding support in near future?
> > > >
> > > > You can see the MTK SVP patches on list which use the MTK SMC to me=
diate it.
> > > >
> > > > There are TI Jacinto platforms which implement a 'secure' area
> > > > configured statically by (IIRC) BL2, with static permissions define=
d
> > > > for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> > > > heard of another SoC vendor doing the same, but I don't think I can
> > > > share those details. There is no TEE interaction.
> > > >
> > > > I'm writing this message from an AMD laptop which implements
> > > > restricted content paths outside of TEE. I don't have the full pict=
ure
> > > > of how SVP is implemented on AMD systems, but I do know that I don'=
t
> > > > have any TEE devices exposed.
> > > >
> > > > > Let me try to elaborate on the Secure Video Path (SVP) flow requi=
ring
> > > > > a TEE implementation (in general terms a higher privileged firmwa=
re
> > > > > managing the pipeline as the kernel/user-space has no access
> > > > > permissions to the plain text media content):
> > > > >
> > > > > - [...]
> > > >
> > > > Yeah, I totally understand the TEE usecase. I think that TEE is a g=
ood
> > > > design to implement this. I think that TEE should be used for SVP
> > > > where it makes sense.
> > > >
> > > > Please understand that I am _not_ arguing that no-one should use TE=
E for SVP!
> > > >
> > > > > > So, again, let's
> > > > > > please turn this around: _why_ TEE? Who benefits from exposing =
this as
> > > > > > completely separate to the more generic uAPI that we specifical=
ly
> > > > > > designed to handle things like this?
> > > > >
> > > > > The bridging between DMA heaps and TEE would still require user-s=
pace
> > > > > to perform an IOCTL into TEE to register the DMA-bufs as you can =
see
> > > > > here [1]. Then it will rather be two handles for user-space to ma=
nage.
> > > >
> > > > Yes, the decoder would need to do this. That's common though: if yo=
u
> > > > want to share a buffer between V4L2 and DRM, you have three handles=
:
> > > > the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use =
to
> > > > bridge the two.
> > > >
> > > > > Similarly during restricted memory allocation/free we need anothe=
r
> > > > > glue layer under DMA heaps to TEE subsystem.
> > > >
> > > > Yep.
> > > >
> > > > > The reason is simply which has been iterated over many times in t=
he
> > > > > past threads that:
> > > > >
> > > > >     "If user-space has to interact with a TEE device for SVP use-=
case
> > > > > then why it's not better to ask TEE to allocate restricted DMA-bu=
fs
> > > > > too"
> > > >
> > > > The first word in your proposition is load-bearing.
> > > >
> > > > Build out the usecase a little more here. You have a DRMed video
> > > > stream coming in, which you need to decode (involving TEE for this
> > > > usecase). You get a dmabuf handle to the decoded frame. You need to
> > > > pass the dmabuf across to the Wayland compositor. The compositor ne=
eds
> > > > to pass it to EGL/Vulkan to import and do composition, which in tur=
n
> > > > passes it to the GPU DRM driver. The output of the composition is i=
n
> > > > turn shared between the GPU DRM driver and the separate KMS DRM
> > > > driver, with the involvement of GBM.
> > > >
> > > > For the platforms I'm interested in, the GPU DRM driver needs to
> > > > switch into protected mode, which has no involvement at all with TE=
E -
> > > > it's architecturally impossible to have TEE involved without moving
> > > > most of the GPU driver into TEE and destroying performance. The
> > > > display hardware also needs to engage protected mode, which again h=
as
> > > > no involvement with TEE and again would need to have half the drive=
r
> > > > moved into TEE for no benefit in order to do so. The Wayland
> > > > compositor also has no interest in TEE: it tells the GPU DRM driver
> > > > about the protected status of its buffers, and that's it.
> > > >
> > > > What these components _are_ opinionated about, is the way buffers a=
re
> > > > allocated and managed. We built out dmabuf modifiers for this useca=
se,
> > > > and we have a good negotiation protocol around that. We also really
> > > > care about buffer placement in some usecases - e.g. some display/co=
dec
> > > > hardware requires buffers to be sourced from contiguous memory, oth=
er
> > > > hardware needs to know that when it shares buffers with another
> > > > device, it needs to place the buffers outside of inaccessible/slow
> > > > local RAM. So we built out dma-heaps, so every part of the componen=
t
> > > > in the stack can communicate their buffer-placement needs in the sa=
me
> > > > way as we do modifiers, and negotiate an acceptable allocation.
> > > >
> > > > That's my starting point for this discussion. We have a mechanism t=
o
> > > > deal with the fact that buffers need to be shared between different=
 IP
> > > > blocks which have their own constraints on buffer placement, avoidi=
ng
> > > > the current problem of having every subsystem reinvent their own
> > > > allocation uAPI which was burying us in impedance mismatch and
> > > > confusion. That mechanism is dma-heaps. It seems like your starting
> > > > point from this discussion is that you've implemented a TEE-centric
> > > > design for SVP, and so all of userspace should bypass our existing
> > > > cross-subsystem special-purpose allocation mechanism, and write
> > > > specifically to one implementation. I believe that is a massive ste=
p
> > > > backwards and an immediate introduction of technical debt.
> > > >
> > > > Again, having an implementation of SVP via TEE makes a huge amount =
of
> > > > sense. Having _most_ SVP implementations via TEE still makes a lot =
of
> > > > sense. Having _all_ SVP implementations eventually be via TEE would
> > > > still make sense. But even if we were at that point - which we aren=
't
> > > > - it still doesn't justify telling userspace 'use the generic dma-h=
eap
> > > > uAPI for every device-specific allocation constraint, apart from SV=
P
> > > > which has a completely different way to allocate some bytes'.
> > >
> > > I must admit that I don't see how this makes a significant difference=
,
> > > but then I haven't hacked much in the stacks you're talking about, so
> > > I'm going to take your word for it.
> > >
> > > I've experimented with providing a dma-heap replacing the TEE API. Th=
e
> > > implementation is more complex than I first anticipated, adding about
> > > 400 lines to the patch set.
> >
> > I did anticipated this but let's give it a try and see if DMA heaps
> > really adds any value from user-space point of view. If it does then it
> > will be worth the maintenence overhead.
> >
> > > From user space, it looks like another
> > > dma-heap. I'm using the names you gave earlier,
> > > protected,secure-video, protected,trusted-ui, and
> > > protected,secure-video-record. However, I wonder if we shouldn't use
> > > "restricted" instead of "protected" since we had agreed to call it
> > > restricted memory earlier.
> >
> > Let's stick with "restricted" memory buffer references only.
>
> Until now, we didn't have a standard to balance our naming choice, we
> simply wanted to move away from "secure" which didn't mean much, and
> restricted met our needs. I think the discussion is worth having again,
> now that there is a standard that decided toward "protected". Matchcing
> the Khronos standard means reducing a lot of confusion.
>
> https://docs.vulkan.org/guide/latest/protected.html

Yeah, that's fine with me. I don't mind changing the name again as
long as we progress. The latest version of the patchset is here [1].
I've published a demo and changed the patchset to provide a heap
interface instead of a special interface in the TEE subsystem for
memory allocations as requested. I'm interested in feedback on the
patches in general, but in particular, on how the heap interface is
provided.

[1] https://lore.kernel.org/lkml/20250305130634.1850178-1-jens.wiklander@li=
naro.org/

Cheers,
Jens

