Return-Path: <linux-media+bounces-43429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0EBAE444
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 20:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2311188232D
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 18:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E386526B759;
	Tue, 30 Sep 2025 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="H1T1I+SU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982326980E
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759255285; cv=none; b=LdKPzC7PgYfnxDv/w9GegLXmaShIFmOgepLn8AGo1S35g6ydYO4T1bVduBt5EckD/lZdzfs809pERTjdLVIKrVh53VTnQBCkHC2td5svgvgJbFDOPOQc+K3n5krHz/TQKUHwfKXqNv4lve0MHf2jBKfgXZD81JYVSJP+sV7A8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759255285; c=relaxed/simple;
	bh=CmU/nQz4pk6R6MKvbixSO4MFZ/TvoWOucH/+02262y0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=UP16mrYuuzyDuW5u+k18T8spLG/VxUDSANYdhYjMp4DMKbuhrK9k8CdMEeagoV0u0OXalortFTlspWxJAxfs8Jjf0PH65WFSBcXq33oHjn3mfLYfPk/UahP7SK+1J8rsC3kpBMobk7+MOW9ISLJA8kgaGwCvfoyBhlC0dSO2mho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=H1T1I+SU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e44f22f15so444502366b.2
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759255281; x=1759860081; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cTmUhwIZMdUL5arPtjIIT/xe6vK2ULCVvZmlUK+YHG4=;
        b=H1T1I+SUXVaJ6Fev4M1BrGTm9C5nV4l3G4xRXBg69A5DucyASIwpsaic9H+Dcb+T/5
         zWWOywDgKzLHrY63NHlvYxemahadylmUmX1ubu7PkG3cIF8TDt5XABM83eS9HaocohuR
         PfsrahTiKf74nMDoe97og4WxgB77cnjsjvBvReTN6UPn4xIG/RuIdwFGvJiBrZdDq7Gx
         sxVJ5oQzUQ+ZEvIz3w6IrsHmrju2S2JxrK1wpmxYMS/VqrCodJH1mmmEjabprLBvOB19
         8r1vB4Xha1D7QaYkZDc1MIRbcQYrMqxyhFuiyQqEGN9E/3utduf3CVAGeGmdAWgqLIWI
         5zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759255281; x=1759860081;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTmUhwIZMdUL5arPtjIIT/xe6vK2ULCVvZmlUK+YHG4=;
        b=gAa84kZG7TQlDQqI8GrAi1LwFf76eJ8BvHNeF2H+vCfM4OnDopPhUZR3/gUG2LdMpd
         L2T+clwwwo2vzgVfY/gphJXSEJS13FEmkQePKvegsaa93tqf14u8K4CJlEv/htPWs37O
         A+Zo7PeMaZ0O9VygRTj5CvXfemHaK2lsHDzWWCOhzkPTeYlVypAYmRTLvIqsm3oaxQ/6
         c5oU3+/yyfv61/YmEb5zfQDVljo3rsLiCFfAYKfMnCY6660wYDCKJmCTmMgQ0XCFKXXM
         jyit1vdrMME+4VAE6LJdsr4GjG0dtVODWCZK1A0DVYlAKYyNDgstI2wlDC5YLAtrjFvQ
         +KnA==
X-Gm-Message-State: AOJu0YzPoiJPOPusmX/fOdQqQFBN0grVSc+A5WEjdEnvniO0xKd7Bkvq
	9FLQcWJ/vuLgFx6cGw2zJfRjTWQ0Iw+0qdD4OaaUqu5yhVJVmX/aOWxWITQoSg==
X-Gm-Gg: ASbGncsdZ2YbYHZyAMwIHoxnGLcRQXFRiC78LwEn9Dg+xZRCHy73DZtG+Mw1hIMcfP5
	hiHeR+JzzCAktYiZjCAAhw6en9clyBcgMT1A831rAeBJ/QfPIAE7w2lJD2/Z+TGWCBDdDrYOkch
	7k9K42day3XGW67424i5pymJMDnqyMf7iz2z6mwY9GL0Ty88vnPme2pfVlxuHCHGbVqSZNW//YF
	2IgRv6ea9NqsWOF7yggoggyuey+G74XozAjlq31bciimOdb41UUiSvxCZ7EBWq1YAOAsf3nzbN/
	sFQ0y8zUTELFWiUAjEkwB0OzdtcS9QgqOmNX3ENmXXF3cpY5SRzAkdp2fblhZljoTcHDVNFPujn
	VbvxRk1ORItSJF/ouRx0BYpQdhKp99pw/V0kai4Q0OpIGFZI9kglLus8G18bu/W0b9G7TSHXywG
	CEWERdbDUt1f0P3xHwXqKAqYxcwYB/fKxX+fg+wUmUx030RiiKDnk=
X-Google-Smtp-Source: AGHT+IFssvZxstzX/w74UfjbB9XLESwPrkSTHhHPQPYQg1C5wInj+8Ao8vJ7WHnRtgy5ULN164/okg==
X-Received: by 2002:a17:907:2d88:b0:b3e:3638:4980 with SMTP id a640c23a62f3a-b46e30e9fd2mr59571566b.22.1759255280452;
        Tue, 30 Sep 2025 11:01:20 -0700 (PDT)
Received: from ?IPV6:2a02:810a:831e:5200:9107:e806:d2f2:3b76? ([2a02:810a:831e:5200:9107:e806:d2f2:3b76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f758csm1208078866b.53.2025.09.30.11.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 11:01:19 -0700 (PDT)
Message-ID: <63e94c28-4013-41c9-8354-bd5a2b9393e9@googlemail.com>
Date: Tue, 30 Sep 2025 20:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sean Young <sean@mess.org>
From: Gregor Jasny <gjasny@googlemail.com>
Subject: Time for a new v4l-utils release?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

do you have any objections or blockers for a new v4l-utils release on 
the upcoming weekend?

Thanks,
Gregor

