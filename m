Return-Path: <linux-media+bounces-24470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3315A0656C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 20:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5643A3204
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 19:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D280C201019;
	Wed,  8 Jan 2025 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="17YehbF/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8415852E
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364863; cv=none; b=I/gr7hIzBN5/yh7aBF2VRlBJQcikLyjufl1Ll/DaQRYMT0sy0HyvfVmJvm4Q818FtHiNYhzBsCs6qxj2qnRrsq/Vj5Trpp3T+dYr51qW8Jnnw+5676V+lfsWbn53GeTKB8m7yf2pUedoJPEkvXcGePwhPA6nUrNwrOEsDK3dRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364863; c=relaxed/simple;
	bh=AwXV8eOYa0jUUOJDLNlx4dV6qMMcao5DisevpgqObMQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y86W2H7zcPQj4kxwn5twJ1ugj6v4cgBFxioq+snB0sOCjc2AffRk5lCt4vgQ2Wklgo4g2a+00r/AvHrPby3vOY+vXYQjqFvoN9N4iv6RdWhZtXRSbIDmY2nN42fgmvqNPrJCmRP/I/XzzdmbXnLPGNhvmOeUOdTTEQtQOdjKQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=17YehbF/; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678cd314b6so612951cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736364861; x=1736969661; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=17YehbF/Bs6nlGHH35N/VehGqAa6w4BTT0h9Eb96BvYB4iAA+xrsZkOnyF5J50QvvX
         ruWUTAudCM0Voi3rUZjsC3XXGY+mIAqmTkzM1vEASCxpHO02PCjRHb69jcLoo1fIvYNM
         ou6OhmK8GaZdCwYXR7bYOFfBMp1WfXwK6hSF44TU1I67YGfmHHwQitl1y+PDs7Jjjss8
         606omRqulRmNL5GJcPYL2j9KllIVaNvhmxOrHeq2sSmiDUxWMKdOqjuMmdAKjhIAtfA2
         7+ldbn/BlMr0U3bKMzqIjc74oHJJbLt/ZwbJsNPTkaHw+olFEKMZSU60hU60WV8HFBAX
         jn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736364861; x=1736969661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=mCxW4HhF+nclMDjneOKGluKQHwOcVCIN47jfeE7nFDCnVHIzn7xhcsOLDqmqti180t
         TWVc4Y8VcZn8rYDJ6BUl4J+3/+CCBwVDaoWYa8y9ydy4UTFBmvYBbXQrjT9rfuh0Qe5T
         GouZMXWgOY7d4awylEbv+Jj+Mr01IO9jHsTHImzgXKHD8sQpQA9w3o5WoKGvhAEy852Z
         v4w2tLsygPYggWbNxsoz5CnQP4VLvkjBUGlH8JN9gDMYR7VBfDmiSudEG1/rdMH14K2p
         QcKRF+e77e7tac/Y/AJr4RkPh8l8HtluwkVTtXl9GekxClFwHJv6QGt6nyPOu9biCeTR
         P0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUhu9uxy//EE0JQ81Mmewp21d/6SRUfBQ6yR1SurO2xU/EiNy1vgItY3JbRR9mP9atMA1trvWun4lMAWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbx7EJr0TGz3C9FYPnJ3eFt9ztafDgm0vx4cMXqXFsVtt3A/3x
	Qgcd50y9o0oXrySOM56kjqsJc5WLBXg9Q6A30Jy71Bxt7w5Ar/wOcLQhQYkPOlg=
X-Gm-Gg: ASbGncvrDXBZWHLd+LV62v+rkl1FbiFkUKcOdeASDWqqL90oO8w9FrJnwY+SMvhidL0
	pe6mlzWeospkfqXM87NZ2fGpK633jKxw8N7HuuBpbpXtnV7+VDuYAJjgRIy2pGlL4TEEnWEJkk7
	8sir+U6Ib65pkimuHQiOSQOnJkE7V1auC6uJhDtBo5rO547qW5BLcPjURVbW9vF7pCeXhL/8kjd
	jD1CDXc28raHp/SKsOAelxvAA0lp54qfB1bx8vSabN4G6vL31DxLbv1Vg==
X-Google-Smtp-Source: AGHT+IHHoBOVEADoDwJ5SEc2bvPkTd9ig7fH6khIBw3ziijVw29fWtXY3bUiaQ9CQqXYbSXbLj0hfg==
X-Received: by 2002:a05:622a:1792:b0:463:64b2:2e0d with SMTP id d75a77b69052e-46c7107a922mr65440061cf.40.1736364860717;
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb16c7bsm199636001cf.63.2025.01.08.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Message-ID: <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jan 2025 14:34:19 -0500
In-Reply-To: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 07 janvier 2025 =C3=A0 14:36 +0900, Ming Qian a =C3=A9crit=C2=A0:
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> If it can trigger an source change event, then client can switch to the
> correct stream setting. And each frame can be displayed properly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Docu=
mentation/userspace-api/media/v4l/dev-decoder.rst
> index ef8e8cf31f90..49566569ad26 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -932,7 +932,9 @@ reflected by corresponding queries):
> =20
>  * the minimum number of buffers needed for decoding,
> =20
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed.

Did you really mean colorspace in the way this term is used in V4L2 ? What =
we
want this event to be used for is when the capture storage size or amount
changes, perhaps you mean when the capture pixelformat changes ? This will
indeed happen if you change the bit-depth, subsampling (not mentioned here
either) or change the way colors are repsented (RGB, YCbCr, etc.).

> =20
>  Whenever that happens, the decoder must proceed as follows:
> =20


