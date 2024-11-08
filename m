Return-Path: <linux-media+bounces-21120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419E9C188E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0C49B22CC0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320B1E0B66;
	Fri,  8 Nov 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuP5/+52"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970A47F69;
	Fri,  8 Nov 2024 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056339; cv=none; b=VncnwmQicteYGUrNelJrA2vApbtKkPig9XrwqEOuUj0X5FiYSMWLQTSm8ZFHgpo+3Q4NwlKQVsiFP6bu+pi6mlzgQc6+bar5qzjf4pd42l7GmgksJbcaMp4OPd6fqHXSOy5K7WoqPdBkgCcMq4bGlCXOCHeYGsoKqA5rG5mW9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056339; c=relaxed/simple;
	bh=ePwEc/N6mQu3ciKPFSKeo1yjhMAFOZFYMAdR5v8/zJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZo3DHTFE3ARxzXA356m1FoEId5/mgnSLVPc63zJ/6JEbjrfxQ4Ws8CBJE8iQMo/dgBEVIZarMPEne8YOQLcWQM4E7U8ajYqj05DX5Vywlr6RlAEq3WU1iYmieLoeu+HMKM8ebF4iKfPWOekTnE+0iOHyEaVw9NKnaCln6uniCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuP5/+52; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20ce5e3b116so18177175ad.1;
        Fri, 08 Nov 2024 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731056335; x=1731661135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePwEc/N6mQu3ciKPFSKeo1yjhMAFOZFYMAdR5v8/zJ0=;
        b=HuP5/+52YVqnEYPCg0eVWTALD5g8gy1N1ym4ZUIvbrwRXOU466ZXe1EK7kBCklTVLg
         dq0hTIu7WcLKyPiGArH1Y/pgY/c5VrNI5+PTABR1D3Qc9wLefh3QBgd/KdaGj6zMPa2c
         M8CDwWQ0Lq9ptymhD/WP55eqQzHQqK0KPwE6kJPMiTJz6EMuUHnQh0rdaPmHg1q0r2Tq
         iLylXO5IfsraFZu4fsxKhSWSeLMhV58ItAt9LmKqzHvBQ88xPo76q6gG8nMqnTuAerX2
         DhQ1wn7SF3PaIJyb7PsFytwe76oZQAHcNWSsMVxbhgFFRdji25iSyC5cSP/o0EtarSbo
         q26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056335; x=1731661135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePwEc/N6mQu3ciKPFSKeo1yjhMAFOZFYMAdR5v8/zJ0=;
        b=Z+jJvc9DT5Fy3O/PSyN+kOpAOBcTbFGFAG2B8UKPUisyg3k8K2yft6IgC6XZh16k0D
         ajPlDo/DRD8d4e4SdU8FjLMiOpuIVY0aHQoMyAbBHtuY7xfI8mWhrYA+2h3WxsZDQn4F
         AUPD3Q1a7vRtQcSjk2ojBoaQ+3YOFlpPvZA/1xpNZYTevwn2vJYgBPG4tYGg+HDGNgp+
         l3TJ0OTkJsYUTYmoys4X/393XkckNAx7+8X10N/gOfIEBMjItTiv5YGgMgRCpw58j8Hz
         jxd7WkQ4oASI0VXSBbzMYzYyzOYu8h7ev7cpfuCRs6n0nFmg150dODwO5DyKBA5lKT4c
         I4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWNtEXJbhexKjmf14JQWFCfxWHwMNMmWmlXDjAKpVDJYLWF65AiN2oVmBUAVWPXe/2OgzWJXRsyz8qTTqM=@vger.kernel.org, AJvYcCXOJgYZah42X5ABnz5V1rt2m2dZTHfmH2rV5m8mC1obNDBGtxmE9MgVhvm+b6W4H9JHkJ5gI+rYvwKaqrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAHWbW1fOU8zFRNSaRFYpJvcK7tV4kmzKUXTIR2/5MeM8IO40M
	8OtFsvznRc93Avbj9J6VxdK5U8M+/ZHxW/Hky9VOiSLJyB6/9tPO
X-Google-Smtp-Source: AGHT+IGTunI+zWGBgwG/tsHTdt8sjAPFWfeG7cDWe3Cawk7O/1zAMUQn8OPhGWXOdMiI0HSCWJCTYw==
X-Received: by 2002:a17:903:41c4:b0:20b:8642:9863 with SMTP id d9443c01a7336-21183d3fb38mr24630915ad.18.1731056335255;
        Fri, 08 Nov 2024 00:58:55 -0800 (PST)
Received: from archie.me ([103.124.138.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e5a9ebsm25608855ad.198.2024.11.08.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:58:53 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5A12241E4B82; Fri, 08 Nov 2024 15:58:49 +0700 (WIB)
Date: Fri, 8 Nov 2024 15:58:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
	kernel@collabora.com, bob.beckett@collabora.com,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
Message-ID: <Zy3SybM9e84LmgFo@archie.me>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <87ttcj0z8x.fsf@trenco.lwn.net>
 <20241108082416.u6vvdmmhadfqtiau@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VBvAy2aHw5c/hOWU"
Content-Disposition: inline
In-Reply-To: <20241108082416.u6vvdmmhadfqtiau@basti-XPS-13-9310>


--VBvAy2aHw5c/hOWU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 09:24:16AM +0100, Sebastian Fricke wrote:
> Hmmm my Google-Fu is not strong enough, I can't find a docs-next
> anywhere neither in https://git.kernel.org/ nor in the Linux Kernel
> documentation, can you point me to the tree?

git fetch git://git.lwn.net/linux.git docs-next

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--VBvAy2aHw5c/hOWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZy3SxAAKCRD2uYlJVVFO
o6m2AP0YE86zsukCHUF7W8fOPfBiBHAL8qjVO//8VWtrnnOKtQEA47g5Kr/Ill87
t6Sv8w0C0UtfxuH8LY1XWZO35v/Djgw=
=468n
-----END PGP SIGNATURE-----

--VBvAy2aHw5c/hOWU--

