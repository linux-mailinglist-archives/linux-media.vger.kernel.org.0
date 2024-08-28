Return-Path: <linux-media+bounces-17051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E382962D5E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8091C2178C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2C41A3BB1;
	Wed, 28 Aug 2024 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzG0BYje"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8534CC4;
	Wed, 28 Aug 2024 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861608; cv=none; b=slLPTcBWEp3Nw3IDraLl8/sqKMOrterHw0/H85ZY6a7lEMVu12m6u3/QV53mIk7yGvLvY8cRMJOOKDM8t8DunqH+m8yalalLZpxRQpRCHVLuTxTRVCAmklHHYtxYL7P4bn9mblSAJ0bPXNyQt/PtyEgmp/9Y78ccNZV0+BBS7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861608; c=relaxed/simple;
	bh=Lvej6w5uIY8bD1Kx4q4GEaKPNFurV+4bBu+6h8JrzuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFjwChC8WXM+ShcffKjVfFqQrFjx8yVWH5EnVk+SF1eYLu0240GqAx10i4nfn3BT6hC/U1GHLR9ZirnVUYTj3PSjusMm7P56pQHg5SFrjy7KO7TBzv1LsqzToDiODd9nlqv696s+G3uOrAScXLAgrv35RX0EJQpNb6hCKHNDfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzG0BYje; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-204d391f53bso31123975ad.2;
        Wed, 28 Aug 2024 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724861606; x=1725466406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRQW4GdIFwAz9Vj7IzfPe+8EkFNaAd7KHI5+HTfnkDE=;
        b=gzG0BYjeBRtnblzUoRCRE4bpTY3cM3vaLcmXuqCM6AaFLNEyPMIbDC08w78hCmw6Qt
         eaZPfS2TfpOT7pBU7AK2grVrKdfcr0mlKSkP4qamH4PT4yYnRzn+Gq6mFLCBIe1WMgc2
         MrJ0ZrEXsMl1yaOqXXPnZayGPvHBb4c/nCdKopEpcnhdJ5mgAYKa2fPD8QKXpRNJzQzB
         TF9My9j7K+v54b4o+atKOX9RQZJfKFR6/1Yn5fryKkPoeip5iZuWgfseSsZfSnQeikh4
         DjsFZwVOJ5WGuP6LOSpuQk3gFmAFELb0f/13QI6SWZYjcyxtiRs5izPF0pRSeqxWbK/L
         BFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724861606; x=1725466406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRQW4GdIFwAz9Vj7IzfPe+8EkFNaAd7KHI5+HTfnkDE=;
        b=Ukew1op6Q6RP0mPEjzGe+igNQ1vMMxF5VX6FrR0bZgnGz4xqf6jF/jSq9UnrcHVKd8
         YBd8dV8KDYsRhGprfgBoEJ079tKpSV1yedsfuV+nP/K5Gn0t6ECSVGCEFlzaMg0RhEwc
         Tp0cysyUeAgPHcaiVWeeyLduo/0uBRxj1xhsFsPY7sHFDExARogPNMyoz/CGm192mWHU
         M+5F4lj5Z/1u3616qBY42pJ81y5eNo/juFTZiMIsLunifjQ1qIWgh6XUSatNvWeT4ylT
         YbuVJqeUl95SPJDIf94hb0thTKDw1vzJm50xQZpXTMETS4joOBGLAys9DxaZJu2Qk7gZ
         cD4g==
X-Forwarded-Encrypted: i=1; AJvYcCVkCoU5aElGXocooUxWvWFVKO/RWdcfHgR+giTT7McpYP9OTcxr7MLxK03GXKyHDRUTbZimDveOAFtAlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr5QWbMsUkZLVbKTj24lMzaoniNp/GnwO7Ffo8rRg9tehO7FuY
	eMVwFBreAm+nJYegkRxbYlQ63PpmrjBLlv8mrobnZgfx+PXMz1NkupcttQ==
X-Google-Smtp-Source: AGHT+IEJQxDregpNQV57q5WpbrUNp4P1Khcu+xtzue1u1dzoR06Y8UxmiGQSZ/vWkFR4T9a5z5oHcg==
X-Received: by 2002:a17:902:ec8c:b0:201:cda4:69cb with SMTP id d9443c01a7336-204f9a6142bmr30243105ad.9.1724861605594;
        Wed, 28 Aug 2024 09:13:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3eb8:762:d1b6:97f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557e759sm100237475ad.67.2024.08.28.09.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 09:13:25 -0700 (PDT)
Date: Wed, 28 Aug 2024 09:13:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/6] input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
Message-ID: <Zs9Mox-hIbpPbbmJ@google.com>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>
 <157c368c-f01b-4378-be1f-4af6396d03f9@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157c368c-f01b-4378-be1f-4af6396d03f9@xs4all.nl>

Hi Hans,

On Wed, Aug 28, 2024 at 01:25:45PM +0200, Hans Verkuil wrote:
> Hi Dmitry,
> 
> It's a trivial patch, but it would be great if you can give an Acked-by
> or Reviewed-by.


My apologies, I missed this.

Please make sure to CC me directly, not just the input list. Hmm, I see
that serio.h is missing from the MAINTAINERS file, let me add it...

Thanks.

-- 
Dmitry

