Return-Path: <linux-media+bounces-57957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHIfAW5ozmmpngYAu9opvQ
	(envelope-from <linux-media+bounces-57957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:00:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7197389552
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6902630976D1
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810123E558B;
	Thu,  2 Apr 2026 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGwYdfbq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62123C9ECA
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134585; cv=pass; b=u/sNSFyHrDrMIHi90vYsreMNgRiDckPLzT1W0f3beC/eeckXY+lMnRxdfap/pcVChTVoQWAqQ0yEsjf3kyZFdQ5LvD6qtmDOJHE+5/BQnB6kaJH0lvYi9O5bENSVcU9R2K9m916OestIQyWXLAqR9kP89lPxUW+GD58cTQCu53k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134585; c=relaxed/simple;
	bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv65wJMlL6olFg2JerzMfuupt+MdPVvFnZ5hczlhZuvntKTMry/PkJxM/UF2TpH3L7y5W0VUMM6kS4Frtf+Sw7rJg/lmjX5Q156urAPQfEJEaEgWkbLGz+onRAcDdfkbafRceoCs/luCsiZ2XM7f29SfHB5CfoCuWnX9taXXmGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGwYdfbq; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b983bb07eso497683f8f.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134576; cv=none;
        d=google.com; s=arc-20240605;
        b=K35ePPw0DxPfXZJtAYtd5GMZwXXmSf1qX2UnhjhWOYYCmIFfGwr2MUDUN92bp9czpc
         +1+R1rhL9t2U1FyeHeeV7CQbxBjmOiOyzmEAUedMjEAkLfi3gbCtIin19By7ODQ44XHS
         eXgo5K4tvAJeh8/sVHGWbDHzBQiKfDFglt1BCEFN82NDKMuyHuiQlcXy91MRBhHGzxZ/
         WFIYj+RdBDtqX01UTB19FaBlikSh/FPfE52DdWoYbtU0daEWHdGnV42Ge0c4E2MkrEct
         hnt1NZHWd1vkHRNR6pta2DrxPS0Hov1WCPfsViUZ+i6gtMnmmLBnz68S0J9JENyqIpIu
         wpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        fh=FdQcancM25xb5u6uytazQvkDo/+MRA0irRqZYS3H7rQ=;
        b=OGyclr4esxnAbRKM1ncxe2fXl7ibRsSFoaR11ciQqgENLgZk82X5rYCMVCUX6GZqhU
         jI8NMtWeTmdB4Sax+40PjiSrXV+W7xXFRtyslrdTsg7j3pQbiac3AoYInjJHf9zcSBTI
         iFPpZE49C3pR5c0iGlxfAFe4NHe97D9ARaDX5kP5Nb4ta9POL7EijvPcoezKmpd3tssk
         riSVRIRY4HudOWM44qm7ZJzteHYbS+SmeUPo7n0z2DNgcw/za4Frwq955IWI+dsUTgaC
         jAyUM80r+z4+qb7Ph/61ryOI0R7txiGueG59Acu88u6iY04QSFigDWGV1e5PnFXQcmvO
         thOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134576; x=1775739376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        b=FGwYdfbqtLFBXATE8XIHAjm5lyhExyb+H+KPsVaHkb6EP0AWXMKvqOCFiVwEOlpnfl
         vhhNXV87mS5RB0sxRZmEsyFnaiex6IAE3wPtmHnrY/0cI5/kurDqmzLAWCcz8Zb60nD/
         x3gqZ+ia4gRmNAa8iE/LgShDxSPerjMfjVQW6ptpgicT56RIGO8Nyq/naCDEYqagDEzG
         P6bq4cQcQelWi5jdG8ZbjqvWj7JVGrlp0r4XxHgsyzKMernu29W3XbkTlruwnKq+nr28
         y3A/XX61YZ5CTq5v4pPhBH1OX7lpdh+jf6UfscHN4a0KG2kF7GRSD3O6U//k065H+qOV
         usVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134576; x=1775739376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        b=gCdcEfHPDAdBWAHp6FZEHFgUR6gD4hwaIRpabN5+K1n5Cn4BnccESWgLymrEyy3e4N
         D25HkTLdBjEEO1I2b2JoqdTGpw0oRYeBEPzglmk6WKdB9vEWKLjqKLiSrlQpNTjz9fbF
         Cg9hbPje4ytjs8r0OMc4q+WTADOXIpePAa8TtGvtp1roHLiRo4jucX4PNMi9qiaZb9Va
         MRwZoVfCi2447Hn+4W03lpbZr5ZsMhjFhE8Okn1ElgW+Mm96j8v3svZ8ygNJ77ZPzTfx
         CRcnuyeiLyHlTHxsFU/YEBWrQO6BH/uVgWVaO2rs40qdBquV1ggsVZ4GPMoI1+eUPPLm
         lxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4us75eigDzKQHK8j2gNHN7aLSDh4YF0tSf9B01vDY+SCHF7CaeWV9HLfxGUnI0rLvloTHkEeQ1tHPmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6TIovDbDJkWKOZixUVMWHdlN9MY/OZEUYn3SVIx0SyO7/1lc
	UwOUB133LIJpGfBwJuZH2TAcxZ6J/Gl8ASWPJA+ce9pKGBvoWNrOCV0ptQwDGM8O8pdVpiTeAjn
	xipxPKuDBudwzhQKSZG83vLq0kUIaOaU=
X-Gm-Gg: AeBDiet5RC4akJwz7pF2O3qgXOIe/3la5TDQA0D4xGsqmIvXs1uwjyPC+TbxsLnjn+h
	oRIp0YoqVfBXs+fN/tUqsFQvHATKCZzl0zoqIK5LcPFeFWbjhIwAM/VsqOUb2HrdIqCNoVuwESt
	DvsNqOLAWBEoo7Vg5CKvPZVhRgKCRtReKOhuzfUGNnsaoQhy0xCIhwTeAHAFcWHwBnUONC288rl
	VsCq5TSnP93YEc6uAMBWfoeBPfQisCD/dOoaEuqsF73zb7j51mRTKlLcm9Bei/FXJZit9NAY/3G
	UP/gE2sOQZSHbsJcu7T+5Sjiv12+ct8QO5mbnb5mjwpMy3vZBLn/EhB4JNNr3Um8FlJV19HdrbK
	lvzyvtx1lTIo4HZ2F2uq49KqDhqOSEDu9IyJl
X-Received: by 2002:a05:6000:26cb:b0:439:c040:cc8a with SMTP id
 ffacd0b85a97d-43d150b81c3mr13568988f8f.32.1775134575741; Thu, 02 Apr 2026
 05:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402091827.2163-1-joshua.crofts1@gmail.com> <ac5mFkf5RIEg410Q@ashevche-desk.local>
In-Reply-To: <ac5mFkf5RIEg410Q@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 14:56:08 +0200
X-Gm-Features: AQROBzBQiobo91bTvzjKKMtSIQnrUjZDadWIkQdvPePCAeEFxjoQ9jHpPmctU2A
Message-ID: <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57957-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,checkpatch.pl:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: A7197389552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 14:50, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> First of all, missing period at the end.
> Second, why? Does it fix anything?
> Third, is this the only issue with the driver of a kind?
>
Hi, I was doing some checkpatch.pl work and got a few check errors.
Wasn't sure if it's convention to group all check errors together or do each
separately. Apologies for the misleading commit name, i'm aware it's cleanup
and not a fix.

Kind regards

CJD

