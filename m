Return-Path: <linux-media+bounces-17022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4AD9627CA
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29700285DEF
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54187183CDE;
	Wed, 28 Aug 2024 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiKe2LFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCF1EA65;
	Wed, 28 Aug 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849507; cv=none; b=ZtpHvJD24bAf0J/Q2Zq1opn3Xld0/m5YGfJ645hg5wjKP48ppnOuzdR34OIS3/pDqkHLxE83vY+UWhfFOp1Ku09CQa/2dAxbXFpwwaAghnKn5et7OIY1VTwLgks4xZuvKwxxDgMrEPo1d7kK1tbTR0K7UCXw059Dcsh9q1TzQ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849507; c=relaxed/simple;
	bh=4J50RqiLDOst+y08Vao8SY7CxiSjp1DLN8Uqx1RMAio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jExgV+kwAVFzaXnpNDxFRPRMiWIEgTexCfiOMttELgeUYBQQDh4kBbBd41068do4bQ1m70Yi8oVPLeXRBPhaoylh4kaho9l8gCNbIfTw1EuNoJ/fBBlOk3FiPUcjC41CKKvi6QsDWoklcISua/ZQDkYGKq3xT8UyujoQc4G/HVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiKe2LFv; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-498c3d1d788so1982898137.3;
        Wed, 28 Aug 2024 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724849505; x=1725454305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpjJpmKtky2Tl71ReQ1r4sHQ41um+RyLqix68lKsPa8=;
        b=CiKe2LFvVesLwmGpphDH3axjZ+JKJ6lLHUv1xz/IagJ2x+WG04T2ReCjYAz4V0ejuc
         lQXziIT/gwFbLQcY9mCIG9/n4NbS3DWY8XlKbXR/RQttx4OKQcKZVesSiUwng5veSWyW
         gvYXKWIIIG/aHu3iHd6xtDdLIfoNlw7k7Erb6cUE0sF9g7+FspPcjwN+9b6S343G7/w9
         tYcSH6jV4ae+AKwZjpiN3cb6LdsuiXDUoW0m7qzA2nViBwrACPGUp0g2Ei/Qj+ezkBhF
         h0EPTCixncSEKf2EkVi2E0TII1wiNK2TdY8H7cE5qnCgddkgDNIABAX2Upcpv0c2Re5G
         DvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849505; x=1725454305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpjJpmKtky2Tl71ReQ1r4sHQ41um+RyLqix68lKsPa8=;
        b=t76iO6UMiayy6lRjhIi1itsWvdtPQMhXhFLepmc2foRrB3k2mLv6P9tsPa8aln0JPJ
         lM2OR/beMD+tQEp9FDVu3ZWiV2MnUdT/vj7qN/JgOfSIsI+pgYh48myrKwgCrRYUGKyE
         yIdx5NS+YJ36nKB0k4mSYB5buM1d4QhHtzwSFL0/Vk5rcRs/b3x2kXcjchLjcqV+g/f/
         uOl6e3xd9y1e7J2xrsFdwE8nsihAv+ukeukdHA6cFtI+/3v6zQ0q3IDiQ0CiysU/4Ixw
         qFDkSIWk2IdjcGg/93JAARnP1UQ6w2+ZZYuSVoz3JfzW2NgjaD+ZIb78E2HL6nq+0m2N
         BH6g==
X-Forwarded-Encrypted: i=1; AJvYcCUXUGqF2MqIpQZ5Dn+3w6sfW0LnzTADo/xAtq3SySFND3ZVahzVONGVGQ8ySjThwVqlPeOua5CHjnCRWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrSHAzNAkFEORiK/9Vuconrf/PYUHiFwpb5tjEGw+szbaiIOex
	iaBUcPuuBY8Tky3KXBPxzJg3DbdqCERjnlvzwtOT5HDXfRDA9u2IV8dqekHliBTJn3zQFAjV5Zw
	Spchl+HXANHglf7Y0w9tTx+vTOzI=
X-Google-Smtp-Source: AGHT+IGOHpVd/1CZoDzkJg5OUS4BdyUcFqP7bWta+rkp26TZJ9I559IEcYMqcPooujBLRm7n+NkxohFOVhTI+urw6YU=
X-Received: by 2002:a05:6102:c52:b0:48f:23b4:1d96 with SMTP id
 ada2fe7eead31-49a4edb3bf8mr1708348137.16.1724849504942; Wed, 28 Aug 2024
 05:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl> <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
In-Reply-To: <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 28 Aug 2024 14:51:27 +0200
Message-ID: <CAPybu_2UFq6Rnyi+wPEGtXYLW5gF9a6yKiOBZwN95XymAxkxjQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: videodev2.h: add V4L2_CAP_EDID
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org, 
	Erling Ljunggren <hljunggr@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Fri, Aug 9, 2024 at 10:14=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> From: Erling Ljunggren <hljunggr@cisco.com>
>
> Add capability flag to indicate that the device is an EDID-only device.
>
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  include/uapi/linux/videodev2.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 4e91362da6da..987c821aed79 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -502,6 +502,7 @@ struct v4l2_capability {
>  #define V4L2_CAP_META_CAPTURE          0x00800000  /* Is a metadata capt=
ure device */
>
>  #define V4L2_CAP_READWRITE              0x01000000  /* read/write system=
calls */
> +#define V4L2_CAP_EDID                  0x02000000  /* Is an EDID-only de=
vice */

Would it make sense to add a check for "EDID-only", I mean, if the
driver sets this cap, then it should not set V4L2_CAP_STREAMING or others.

The test could be in the core or even in v4l2-compliance.

Regards!


>  #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioc=
tls */
>  #define V4L2_CAP_META_OUTPUT           0x08000000  /* Is a metadata outp=
ut device */
>
> --
> 2.43.0
>
>


--
Ricardo Ribalda

