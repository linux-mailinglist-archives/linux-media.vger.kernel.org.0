Return-Path: <linux-media+bounces-11595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF018C855C
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45AE2281D18
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A15A3D0B3;
	Fri, 17 May 2024 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QyLp6nQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C413BB35
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715944486; cv=none; b=f2cVOGrjCYTK1750b03T1PFl26zlMwU7upQHo4RymdOodib7saDdpHQu6WbLkmv3H8YoGAjMuLdyj6ntfQAdSiKtAPaQh340gBpZuD9pYvgX0D7jCCnwIhDMAoQUWFoRQiwBZLaEEqQkm4WqVVYHP37f4RoKZYMFqVnBxA7je5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715944486; c=relaxed/simple;
	bh=e+XAuOvAFUdi4IQ1zCN48vzga9sNnIJxS4aRTHETUoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg4nHzB9yCkUzltkUt04hqz6uxYudm5lxhDh2OtD9ANfWjSfbZDqttwuTQ7tv+1jvEUEd8TW1dwBnqz7ppQ+tra9ucP0vBrdaJ590ooKP/X70sFkdOJTSFCsHpry+e1OMRipNA+3mwxaV/0D54o3wUgRjM2Q2Y54j+/CKC3+qfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QyLp6nQ4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ee42b97b32so5327385ad.2
        for <linux-media@vger.kernel.org>; Fri, 17 May 2024 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715944484; x=1716549284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T7ld5gqG1mdDMHWhl5oUSJV/Cw5HIrwo5wbgyti6pU=;
        b=QyLp6nQ4Bu75Q7gX4vTrvWS9Yqyzk3DpwEPcwKrgVjOsFmbrouHFaaSS44lq4FlSZZ
         Zvd9meo1mJ/IATTEZKcFRxtUW0xbvuH38d7+nylq/h3QZvq2y53Zy8/5RGUnj9ewOaoE
         E1BQBtIWQT/8Wx3+cHhC+y1C8kjtiixarxxmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715944484; x=1716549284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T7ld5gqG1mdDMHWhl5oUSJV/Cw5HIrwo5wbgyti6pU=;
        b=oY34s0dKiXPBPBj8uTKgMaLqFe4zQvd0Fd92zmwmmZpdN4nBDo0urpR2c53jX3YcJe
         k6RMxWYbgcoAKh9mESztNJF+z9GC/s1DJZ8zPpIZKCABzDu9O9Kxmbnd3VnLr5G65olc
         dpq1qSGKPg7Js7hNDt56LsV/i2PiKxx9JqMLoXvP4KR5LJt5j5fZ+w9E7lh0LPs0NTeI
         cmnPRr1KNStv/fZ/ugSgN46tYAMYEEaOdSXykKeweGwWk9MW4gjhXNmiZbGE3TPPTLAP
         ySS5KVRFQv3lBpyVWuXLS8JeIdG0iCJrQEfpR1g1G3wf9BbzLjXklN6Y8SS6UKduF0LS
         jv6w==
X-Forwarded-Encrypted: i=1; AJvYcCXqkqRa87Uq2/piBEjAE8fp21bT5Q98NcTUZRRzWPXrV8QE2KdaFU1zFtaJvDKBYyuI1kVz+qDR0XnGf395dHCFt8/SPZBTT5TbfNg=
X-Gm-Message-State: AOJu0Yz5vTWw8O77WCtL3Ul+gcnvpd6JHixckNL2tj+oOiGpEla4ThM0
	EUWt08B9EIHhHd+Y8PbncKUY+QAS0Fh4+nZYhhtooAokNC2WnzAnxWfV3vDa+Q==
X-Google-Smtp-Source: AGHT+IEaPt70JwxdO5VUcFCcZklahFz3X0RNAqvQiTKvkWwiTLQmTlOPEbT2Ea+R41sDal38OV/tiA==
X-Received: by 2002:a17:90a:7181:b0:2b2:ae4b:9e54 with SMTP id 98e67ed59e1d1-2b6cc772eadmr19985727a91.11.1715944483944;
        Fri, 17 May 2024 04:14:43 -0700 (PDT)
Received: from chromium.org (237.198.80.34.bc.googleusercontent.com. [34.80.198.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863cd9dsm17102271a91.12.2024.05.17.04.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:14:43 -0700 (PDT)
Date: Fri, 17 May 2024 20:14:40 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: videobuf2-core: reverse the iteration
 order in __vb2_buf_dmabuf_put
Message-ID: <3zv3fq5w74frtrcoabtp7s24aob4lisehlwpr2uaj45g7oeoxl@qbz724nghogj>
References: <20240403091306.1308878-1-yunkec@chromium.org>
 <20240403091306.1308878-3-yunkec@chromium.org>
 <9431abcf-15d8-4a86-b824-1243114055a7@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9431abcf-15d8-4a86-b824-1243114055a7@xs4all.nl>

On Wed, Apr 24, 2024 at 12:24:24PM +0200, Hans Verkuil wrote:
> On 03/04/2024 11:13, Yunke Cao wrote:
> > Release the planes from num_planes - 1 to 0.
> > 
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index 702f7b6f783a..a5368cef73bb 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -320,10 +320,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
> >   */
> >  static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
> >  {
> > -	unsigned int plane;
> > +	unsigned int i;
> >  
> > -	for (plane = 0; plane < vb->num_planes; ++plane)
> > -		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
> > +	for (i = 0; i < vb->num_planes; ++i)
> > +		__vb2_plane_dmabuf_put(vb, &vb->planes[vb->num_planes - 1 - i]);
> 
> This is a bit ugly. Why not just do:
> 
> 	for (plane = vb->num_planes; plane; plane--)
> 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane - 1]);

How about making plane signed (since it's just a local variable) and
avoiding any weird additions or subtractions?

Best regards,
Tomasz

