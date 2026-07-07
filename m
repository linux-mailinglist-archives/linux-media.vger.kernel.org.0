Return-Path: <linux-media+bounces-66867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D32LJYIaTWqYvAEAu9opvQ
	(envelope-from <linux-media+bounces-66867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:25:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3071D3D5
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:25:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Rjd/9dWR";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66867-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66867-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A5C3306C3F1
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C503DFC92;
	Tue,  7 Jul 2026 15:13:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4B37C10C
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:13:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437184; cv=none; b=Gl9EKKAYfJWrySMn/tqGa9GJjscTtsS0+cuCwYWwEDYO1DYmBn+PPf/Bte89gEvj3Mqe6aO7YboiA4rbJhS0/3R74+CIfytjlYR7W3D/DHe653lSRUpRd+FWmXMJKkdJthtvZ3HgvIijbf9qQkZq/I0eEoVAP5tukfb9gCJyzgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437184; c=relaxed/simple;
	bh=L9GA3HSPXwxo/D7H2OFbtIaPAfEFhpVVImiahANaNjU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=KKA/YIjVFzgHxaKVfSQhFyzHnY1pl9ykEorschDrzJuWb9gdrluTDP4ul21yD3Zy/uoaHrw3TzLvhevT0r6ABpVFu5yhnxlkWj32awPtmxEi8btjziBde7JFOQGu8iZg5Dbndva2S81Y45atDJZh/6SAEhFroStCyrCJYXXJs4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rjd/9dWR; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so4931717a91.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437183; x=1784041983; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9GA3HSPXwxo/D7H2OFbtIaPAfEFhpVVImiahANaNjU=;
        b=Rjd/9dWRub80WqzWp177YnI4T4GndS+cGo0YUHddI4Y3S25RtVOCTzV8iptIILQ1h0
         GLOIf8b6W9xvW6SimFJ0sI99yjjmpqOSYzkQlE1ei2IxidClGAzHLzvMDBBJud9umF+7
         7yUuKBWYKUjAHG59j1fEwc7AKuXQfNXu3WEY7LXHpROG+LoRShaHIaCGhe/jYTm4ki+S
         jLxLAF/5B+2kXyAkrxRzQ/N2QCw8rtH2JCn+1AoDfoNIEDgNjPtIePQYDmblUP3jogcJ
         uMVDAP1MWgakNW/TuwtAsFIkZSTxxtnQW9A18Y7E29tEDEIqn5LpSMZQt7zMwweY1/ib
         c8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437183; x=1784041983;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9GA3HSPXwxo/D7H2OFbtIaPAfEFhpVVImiahANaNjU=;
        b=S5TGyT1Jphz5whS4sfvxzoNJQ3Lu2BpMBqR7RITIK3QxBAUiaczLmZ7lNO8PYHMVMP
         uzCSBhYrA0cu+PiN8zQcBNCbGarar4ZSm544Nhvh/HXG5PrWASvuU1IIx6/USbP1rd4+
         c6U7Jp5vFCmJST8NEhA0E0X40Oow01Azv20OHifvsSDJHvqMJtjK4RNONCfLszMPKKdi
         EwhQsCT7Tts3zlM9aHvFxsdlhqGhpXsjKSQcs2ZMcEAjjgPo7N7cJP4ikWCKz31ahuax
         +cRWTs+NtVrlgyWSftOmIPChxIs0U8SaoB5Yo8IfeM2z34tDfUwwWKegE9zKWJ2ZVwf6
         vHyA==
X-Forwarded-Encrypted: i=1; AHgh+RoomTtlfX7ULHVAH791vzHsLeVriVuXJ6kgMER9bsZG+R7w0xBleSrwNO4tZ52T3R3MRHVUJa0uctie7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwE8DfTSE6Khr1OLJk25iZlhT6RzaMGs8JfrUxls929yFBdz1p
	57yDmtXMIg5r1Z7p/NdSZJEiTNKRthBZ1x0qvLkRSSjWsMjk7nOsql8r
X-Gm-Gg: AfdE7cmfEioQXnGUzH5Ltwax1RMHTxHqMMV+f+xvJJ4csXtVYqDTIRIcIWtdothvxtZ
	6NpLx/03LS7mDdfB4Q4g5PqXM0sC63Lc0S+uJLx/XtjMYS/7qSlNulLq6Tcgxw4teo4h6h8RlPV
	6WRForz0m3AjYV/9yOqnUaKqpEOKOJGgcPHkddNO9oZXHfRQGW0OmjgfzXy+PZ/HTceYSQkaqhL
	u40AwWaHLSpMOnOIYzeCL4P/MPf1KRmRoFF6kb9vtpRYojPM3dEMPAIb7M/tbKKozWbbPe/YMpp
	/z4IyiM4X/Gqm2SXZ+UWMRZEb3ZSsN+5JOPp6x2I7c0oD/wJ4Vtd5rWKaeB3OlV/8yf2DbUqWKN
	rjEMJSIwo3DVj78xKmj8M6PHAJDz8qBYZHoY9NkBzy3pdMXO547RtjUyqNOfbKCCl393pvLKbG3
	MCcdq3LzE4kBgM4A==
X-Received: by 2002:a05:6a21:e19c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c09c1bd462mr2998032637.74.1783437180818;
        Tue, 07 Jul 2026 08:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm1178246a12.14.2026.07.07.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:12:59 -0700 (PDT)
Message-ID: <6a4d177b.720fb68d.3cc0da.abb4@mx.google.com>
Date: Tue, 07 Jul 2026 08:12:59 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: hverkuil@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 26/44] media: cec: Serialize exclusive follower delivery
In-Reply-To: <20260707150612.2276688-1-ruoyuw560@gmail.com>
References: <20260707150612.2276688-1-ruoyuw560@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66867-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39E3071D3D5

The "v3 26/44" in the subject is a numbering artifact from batch
generation. This patch was intended as a standalone fix, not part
of a larger series. Please treat it as [PATCH] only. Apologies for
the confusion.

