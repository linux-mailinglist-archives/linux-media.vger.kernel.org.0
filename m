Return-Path: <linux-media+bounces-52336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNf4EghIh2naVgQAu9opvQ
	(envelope-from <linux-media+bounces-52336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 15:11:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE74106217
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 15:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A77530143F1
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 14:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB9C27FD4B;
	Sat,  7 Feb 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXZZWsbj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CF271450
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770473468; cv=pass; b=ugMND+iCtiYIHeX9+Jm2T8c1CmNHuqn7SLNdogJ/D4vtS1u0Sn1/lcvkHvC4/8ibj0pqxjRh8PH7++iUs4QQjTlX6jAIwKhMZV+dFQxZPQH+PidS+tVaE6M8OS/BtxPiigrlfRijtieOY4MUpTezv7+ILs/Vzrk08X2hrLCW4oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770473468; c=relaxed/simple;
	bh=ynCu+LQOF1MUOSRJYtAv/zUlhtEmIi/2yBlF5GbMk/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNzxXXfszlaMl4IK29tUkudXVXklks+2S521Rkn2icqnved8FEF0aSr9e7j7a2qU0nGF9ah5qeqJti98+hQsgYhJcjrn7dTCpQyuq00mnHlWEEdrjD6k0EnkNvPNWBy/2ZXGgOzY/JLXYK05rVKb61WZik/qDMoNTyQ9+pu8J1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXZZWsbj; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d45d37c7a0so1030705a34.3
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 06:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770473467; cv=none;
        d=google.com; s=arc-20240605;
        b=R8gqwf1dnFChkuqjqcVImpcaa+Y7nUDdNe8MhM0eK/+kfdzEaZ76bcLZbl+Vwgf0qZ
         0hKOX6rOGQ5WGDZBEoYBou0cDiMNZ/q5Z5EpUgGS/hOma9ZUHhzM+X9yo1lQ7+pF8goH
         nxdDXOyO1bhU2vrdjX2WoU3zQgt4z8WUUWuVsox2RAb4LD1LzWCrzp1Z4gj9OLqb1Ti6
         hHeAAqdu3XDbJ2w16pShu7bwq+mG0+ZU1NSj+5Ay7BNQ0tCnC7b9INWGWbd2LJpkFa5g
         /7AR11F7bSEgiLh72r0tsxqa9Ufy3akyDhweWzXZaLlFfDYqRKtDDwTd4PeymmsFkmWL
         GbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ynCu+LQOF1MUOSRJYtAv/zUlhtEmIi/2yBlF5GbMk/E=;
        fh=Df0qTn9CKdZ2SjZb+GdAh+FfMbfvTk0HnDHcZ82D9VI=;
        b=CvxIM7e/7knSDKQ1xnr2b3DdNPt3Tnly2KACi1LSa22N5vhp3ZkFH5WJ99UDK1KJYu
         xIf3rw5so8Y7eBZFKsLRr/tPLTjFCF1i/al+7JC2UIegWvfQr7CgL912i8xFMEkeVx1d
         Kc57g79FODqdCjxLiHsPhi2GZdKLc8u11mm0othPinhGfHopGBawMwgh8zjNyKfxY0+m
         JhUVB1PGkyiqTgP+lf/zmjBvf+S9Gz+EN0GOMZ4HoihSOKZOg56cYvuQyWhYGOVJhA/6
         7mm2C1yghymwDKlWKAFCFyd93qQca/k8So3O5CgwjtctTTpUzwVVARk028CLNMRHCjgL
         SkuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770473467; x=1771078267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ynCu+LQOF1MUOSRJYtAv/zUlhtEmIi/2yBlF5GbMk/E=;
        b=HXZZWsbj16SxmGxJluLHif1QyEI+Kj0T0cSXxulZEgEKEVrSf72E59DVjMecna3sRC
         5HUnqcc4IMmaOZoRySn3o4CBi8Nsa6chmQMoio8WeyaJfFp2PXS57L47zgFqHeh1AXHp
         t7p6Yhh5wOomDLnvw6FI83ex0979JUfoJdp38u2m5ivQt6xb1P1l5VQgUbDLb/hrBHD5
         bWWS68Z//qrawnwL43NuR2dD5syuqtnzlcPOtDxw5MI27enOg4L5Z8op6He6Ks51hh+d
         MaoFeBL5yI+oTahjn8Cd3QHAgg8v2TBGg06BEf4md/8iL3L7GDMcxguZdroCNw0LLzLB
         Afug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770473467; x=1771078267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynCu+LQOF1MUOSRJYtAv/zUlhtEmIi/2yBlF5GbMk/E=;
        b=s/KvmGKUpOE+SxubuSvgUk3NXZHf9PAKv6vRacARmmLlie5NywTKrug24B99hOFTIJ
         +SqgnMwOlDnM3NpUR+4M/feLmfpYd/PXX5U3UxLgSEpfcaUNK83uHXX8RZFJJKt+i+WG
         3J5nRz4lPt9WTyyYnDtZK+kBwn5wGf4q40ZTQK7cjmoylN1o6ZtwYTPJAZofLro9beEy
         umFh71Td8/+56IZnRMVSiO75Prb4PUDCQ83P9FuWSr9glfEgt9oIKkWa0oFiijAw87cU
         YzDfKMTohjnvlechJdBqYw2tr86WRv1LBNZcjtW8u606mL0+AChhRjEf16R9Mh0oo3SU
         +jVg==
X-Forwarded-Encrypted: i=1; AJvYcCXnjPMUh23ItVMJ3S8VqorCIyzfiG0Hd8FLId7WYiESDLe2vCjbbIu47oRcPcb+1sQ/nQjW4zGIWhAtQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3Z0HK5Ke/ezQwmuMxreBafOvi12NOw6QgtQdXoHF58wZyXMB
	WuVyjyIyYHbKhVpqcLtpP36xDs0KnZfLxejtNN3ZDR54z9Ut5EQGurgFltXjzy+65qvGEKesCHp
	dYr4FEQZbppm0h3N3OR0eVwum52rzKvc=
X-Gm-Gg: AZuq6aJfSks8+IFKrdSMei5etzGMLpQs3MAVaopPAvJqEE8Ca7MtUoZa4uu2Mquk407
	1V8/yMCTv95POGdt7F9f6Xd0yCSTVQuixzMGN8QoXpyu7cHYgGP9/KY7qGVfM7hls8+ikJShvE8
	8E3Oi5JT+cWp+MyRg6wGzp1SSgLZ6gJc1aGjLUr5uGn8VEB+yPf96ouqpqIHIpVPJtVeWJdcPaJ
	RSLzXaarWIfNnE/t2GwE6dtOcVO/R+xr/nYjKquMMjzZ+OcZjdgOl3cInd9iGd6ozrVnXB9jkC9
	N8hbxK1SNCN55jThnxIit2Y/JUq1W7utcXA3CbD7i/P4kT58irokeyHCUPI6
X-Received: by 2002:a05:6830:83a2:b0:7c9:5bef:e9b with SMTP id
 46e09a7af769-7d4643e5575mr3562820a34.3.1770473466626; Sat, 07 Feb 2026
 06:11:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120121105.8959-1-hanguidong02@gmail.com>
In-Reply-To: <20260120121105.8959-1-hanguidong02@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Sat, 7 Feb 2026 22:10:55 +0800
X-Gm-Features: AZwV_QgHv_bKbssi1BqytOrVelCG7ayxL_FlI4KKAvI-JSERB7Ri_i0u3T01qi0
Message-ID: <CALbr=Lb1wp37PH8XyPOUMts-x0Spr04k9HZjbCP8Li1-y9J0Uw@mail.gmail.com>
Subject: Re: [PATCH v2] media: dvb_demux: fix potential TOCTOU race conditions
To: mchehab@kernel.org, mchehab+huawei@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52336-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DE74106217
X-Rspamd-Action: no action

Hi Mauro,

This is a gentle ping regarding the patch submitted on Jan 20.

I would appreciate it if you could take a look when you have a moment.
Please let me know if there are any questions or if any further
changes are needed.

Thanks.

