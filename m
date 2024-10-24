Return-Path: <linux-media+bounces-20271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A977F9AF283
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 21:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E26328AA4D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 19:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5CE21832F;
	Thu, 24 Oct 2024 19:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="S49yD5Ce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E849189B8A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729797314; cv=none; b=nl8elbRoZ5dPVfQtwpEI10UWe6sEip/gjbDhjelPDrZZ0yxb37x5xnU60XI4kk5zGPdyV3SlNzdrnbY/5osKjn8L4w7Vi5VIw3JwRcfybqmDRQqv+RSuUp1WDjCwZdehCMh3mKiQClAXABKBXc44Ftd3lkYhUQv13B5LxmHVmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729797314; c=relaxed/simple;
	bh=afTLfj9K0YOSv1wTyh24hE30TSC5GlaKp865oXMe+Jk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=liQLq3FFZ3K48wmraAcJjnlK8xXeGzMaNDEPqzi/SRrkjFOYoEu2sFXHmP8UYXxIIfoqfmvdVLbs4S2DtYpxywfPNKwPruqeL7dMMXcyPIpYqpQTgu+zwvgeYnkWxr2AL/SmkZ7bzfA4J+ZQnm+B/F5ju3x6nF7b6FvtTbWqfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=S49yD5Ce; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-28c7f207806so626572fac.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729797311; x=1730402111; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D6MiVh5RNkN8ieXMIgcJxRZrsOgNe6TcC6Jn+I52iM8=;
        b=S49yD5Ce/aaHByejOlaQwWljDRd/GIhjvANoDyg51Wht0rsGwBHbkZ+eBihvE+xYqi
         4JWLCG3HIAqeUI63LJWMmzsTB5h9Rgsskje7+17Ioe8bxDzqaiqjHFz0lGBsdH197pl3
         f/F8rD3U4kk8lDy+yDlJuUUPhAHGglMd/IFDQpdRk5jJHzMimxkHvqwMW6IwCJIptvay
         vMfXPCc0C2UH9/faPKQjHl1pdZ2BhFbVG/KAyJhikUxrkHwbssyE7m/HSYEu7iC0JgXd
         w4CUk2ST40RkCMof/oKHi2D7hhUSVHO6X6CcJFgJR7shPUbpcnBrZkV5D6e9sR7X2Yzj
         BzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729797311; x=1730402111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6MiVh5RNkN8ieXMIgcJxRZrsOgNe6TcC6Jn+I52iM8=;
        b=tDFd6OsftiA/ScAzYY18g6rMnmj/vSf4SEIEUcsXbAw3MCtAaTHs2ivSHrYr+CEn5w
         cbUYixhyAeppqMxNTkbQ6ms49DU8+jtXSqLJqoOh8UXbpVkgebxYyKlaBpVABQe8Bm2t
         2MUxmqAiOxf0yG6TGXRKw3PKzEwvzxtem35RtGXkWY1b5QEIuiEi8WIoKFRdDiHrFZRS
         QaUS1dXw0YnJn1ezZEeF+K31D5zhlVpL7ozKYHMcJYL4WcHHZ7uDvvJUqo8yvwZtN8o9
         cU9WZairgFju1bMdZZ+khZJ5iPgAEGE1odhvWeY/zwL81MdNZlB49G0U0y1d6cEcgBzU
         KDLw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ld53pxRGxWNP3CBmi5doNOzyV/RbgjaYSBR8Aoi+mU2lgghX+sJbSsL2P4FP2RfbFX4cvr3sEDZQtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuY2FIO9YYwgSnlQtbaDnPZ/7ZagI8AxohAn11VGcGgt6+bRUN
	DuNEfc/YDiHY0ZQIWO/zZdQ/k2MhAlNe+QqjIizh0+OCES/qj3SVUDxh3Nr1uwc=
X-Google-Smtp-Source: AGHT+IHJrmpACZaa6UXk+myFjU19VfNfDt+5FEoGlBzMQK1BsNvwVHftnYa31dZp0qgb8pOUActXPw==
X-Received: by 2002:a05:6870:700f:b0:27b:583b:bfc2 with SMTP id 586e51a60fabf-28ccb123646mr6885311fac.0.1729797311397;
        Thu, 24 Oct 2024 12:15:11 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659ba85bsm513315085a.9.2024.10.24.12.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:15:11 -0700 (PDT)
Message-ID: <21e01d04d604a9e198afc1287eb2fc953862a68b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vb2: fix confusing log message
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Oct 2024 15:15:10 -0400
In-Reply-To: <5103405d-c560-425d-b307-835896943b94@xs4all.nl>
References: <5103405d-c560-425d-b307-835896943b94@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 24 octobre 2024 =C3=A0 13:24 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> If the number of allocated buffers is less than q->min_queued_buffers,
> then a debug message was logged saying that it needs at least that
> many queued buffers. But the test is about allocated buffers.
>=20
> Update the message to say "allocated buffers".
>=20
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Makes more sense now.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index d064e0664851..26228614ddcc 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2329,7 +2329,7 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned=
 int type)
>  	}
>=20
>  	if (q_num_bufs < q->min_queued_buffers) {
> -		dprintk(q, 1, "need at least %u queued buffers\n",
> +		dprintk(q, 1, "need at least %u allocated buffers\n",
>  			q->min_queued_buffers);
>  		return -EINVAL;
>  	}
>=20


