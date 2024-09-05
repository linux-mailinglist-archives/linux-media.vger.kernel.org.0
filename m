Return-Path: <linux-media+bounces-17662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5462396D60F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7CB6B22B89
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD301990A7;
	Thu,  5 Sep 2024 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOHTi1Xu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED01197A76;
	Thu,  5 Sep 2024 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725532049; cv=none; b=rbrnSXN5UjAF//qNcnQF9Ttof2EyT9PDMHR+OC6SF3RYT5/IavtGyo/2gHD/OXgQA/x0i3LY1va62febzaqrvaumIBhkIxc26dljkve+HDvNPuQmO5fxSawF7Cc4QIUJSDHsBZmIn1GmN09D7bgcuajf0ynTwnp1csUVUfnQh4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725532049; c=relaxed/simple;
	bh=JMiWnaNp2rJzetkKnAwy6Oxo/TbQBaqMm6owphXO7/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpojkpIdc29SBGYJ9UcFpJKOl4PeuDSDNwOmIvpP4hvJ3XVElHhd0qxAkIZZVx8iH702XvOgQBgPuJ+NVGBK69mRFUqK8WiBVw83r5LUu9CNHqpBVuO6PuQim8FcnR6I4GIUdHw9L5Yzwms55ytxjJvI6J3HgfKhhYOkaL49SqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOHTi1Xu; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5010a36e69dso258742e0c.0;
        Thu, 05 Sep 2024 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725532046; x=1726136846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMiWnaNp2rJzetkKnAwy6Oxo/TbQBaqMm6owphXO7/8=;
        b=gOHTi1XutH0brJZkTBLGIE/6rDYGOocBlO9o5ZoMqaYv7NAKxwbohSqAdyFfkkC4F4
         DRHEq3kLN3Iu3eBpXYJwnyFEUidQqJrazp7s5OJ6c4KXedUe5/0X4ro7iJPWfuQkza61
         nzLAB9e6/fykjWWvFi7VGtx1+F2AXbE8diNBJ3OQfSLjogMCWn0krcFEVaPgYMq3Slua
         T3kbuBStVKRuP5vxeuRsFnVfIuDYbYi6TOSvTRI+FBwXvu8axWr5xkzxK0t+2aj7I0/c
         uwKIPlyR/P6o9CCgXrHa16WX2Ej/yQBu4lL92GC0D4poQ3ZJEMbEBHSyYekPX3m7dBwm
         lL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725532046; x=1726136846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMiWnaNp2rJzetkKnAwy6Oxo/TbQBaqMm6owphXO7/8=;
        b=nndrZPLsFCvzjdZiX2XckZHv/wYQyWQMys9NDK6kz794jqwDj9UWoK9MqiFt7vAU9H
         edZidBId+Ll+X8kgKmuCBPFBfNpdSHvwTVDvRui/bDEZC23xCTRJKpZ66HEXupNTf9/Q
         5VfW0gK8FTiwlgXbPKBXr825tB8zkVdJDhw5RFXZZjG8IfbKfzYQoOXAPZDEX9JIqpyo
         T42mBEjpQoVL4SKMZEttndtIRmgMydp8A5nhjW8W2yuUM8qsCir1dz0ob6W707GW8InJ
         O2AtRcasSQDcxnUYwJVvxsGl4uOK1MvF1/HMBonMpCYzI1aeG/8LA3fF56lhfXRVQNgG
         fgZw==
X-Forwarded-Encrypted: i=1; AJvYcCUl2u8q2+FcJvrW97a/Q1q1o5uUxLEBOyFp05hNVETNoS4ILFQ2UklIScvzqeqbzxt5fGAjdLNh94f9Rsw=@vger.kernel.org, AJvYcCVAqK8E8xd2WhGG/m1AU59ahV/n6XaFQRU+m32P9JOv1FMPOyLCfyJ3ozv0pkXzdUVGHdRuDmHsUZgd1FA=@vger.kernel.org, AJvYcCVpCw0Yn7kJ8QbtEtwEVhkbzui2zTE33M2ULgzGCs8dJaAhyYky6HgXPTmy7iGyXgcdqR94/TrhcR7WZsXrA+fpW0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCtQW/HkVFAa5QY8JsKXmb5kMKD76Yq1tsYesc7LiAQECtnSIB
	ljHRtCFJW4MkQVxcw9Kn48SpUlwE9V8g4z7qx5ApvhA2/JYGvZ8tOMg+FGY+4DqYq/8DA5qLdr8
	YZGSz1F9dMAEAKVYH2mE7dbi/R1I=
X-Google-Smtp-Source: AGHT+IFgbTBL4ZgLkSBwcCMLXJ7TmAXzpB9E0KkYZU/rcjvFRKZfAs+wBl3/XuVv2z34RD6Elx84nfzcjI77AtlnMz4=
X-Received: by 2002:a05:6122:a04:b0:4f6:b160:3806 with SMTP id
 71dfb90a1353d-500d5cfc710mr12004286e0c.11.1725532046248; Thu, 05 Sep 2024
 03:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3eeae62a-e22b-443a-aad4-f1a384c0a3f7@ideasonboard.com> <514490a2-181a-42ac-bc54-7a700e8d1bb9@ideasonboard.com>
In-Reply-To: <514490a2-181a-42ac-bc54-7a700e8d1bb9@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Sep 2024 11:27:00 +0100
Message-ID: <CA+V-a8v0s8Unk3pNhR1wgBk_wqkua__Dumq3KT=n-cXUwq=6Bw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] media: ov5645: Add support for streams
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Thu, Sep 5, 2024 at 10:11=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
<snip>
> > I think you actually want 1/0->0/0 routing. The error says that the sin=
k
> > side device has routing which does not have a stream at stream ID 1, or
> > no routing support at all, which implies a single stream at stream ID 0=
.
>
> Looking at patch 12, there's something wrong with the approach here. Are
> you perhaps trying to define the CSI-2 VC with the streams?
>
Yes, based on the previous feedback received, I am implementing
virtual channels as streams. If this isn't the correct approach can
you please guide me on what we should be using to support virtual
channels?

> If you have a camera with a single image stream coming from an internal
> pad, you should have one hardcoded route, 1/0->0/0. The
> .get_frame_desc() should return the CSI-2 VC (most likely always 0) and
> DT (based on the format) for that stream.
>
Agreed.

> If you also have embedded data, then you'd have another internal pad
> (pad number 2), and the routing would be:
>
> 1/0->0/0
> 2/0->0/1
>
> And here .get_frame_desc() would also handle the second stream, and most
> likely for that stream the VC would also be 0.
>
Ok agreed.

> The stream ID in the routing table is a software level concept, not
> related to the VC.
>
> Also, the internal pad should use the sensor's native format, not
> UYVY8_1X16.
>
Ok, I will update it to MEDIA_BUS_FMT_SBGGR10_1X10.

Cheers,
Prabhakar

