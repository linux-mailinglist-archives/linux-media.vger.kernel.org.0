Return-Path: <linux-media+bounces-67548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uGhWLtn/VWq3xgAAu9opvQ
	(envelope-from <linux-media+bounces-67548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:22:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14A752CBD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:22:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JlMpiiPu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67548-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67548-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 858C830148E7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BF643E9FF;
	Tue, 14 Jul 2026 09:22:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773F43D4FB
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 09:22:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020929; cv=none; b=RM5GKlP1mWzzb3y1wmQdw+MR4Gm9SL0hy6HUoAL5c5zbAHhNbV1WszuxuSk2GAnaLwkvyJcm2IpTtiJqNbCxcvnDPc6iT3AzWr07fqYQhSnuXWp1WY5B8pm3+tW1K0s/ugbY5pDRRY+OGZ8htQsDziHcltQq2+b5qNil58l/Dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020929; c=relaxed/simple;
	bh=W8OT6ovmAQkwBwCI5qoFSNzG+sz1ik3/qbazlMkp4fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOeFzbP+H3TZsLh/ACIlQmFj2LKjoj+N3RwUnlGNRpKnXUX2OJfN7ViS1ssYjpr/N9kvzrwC4MSTLTD/UfZgjcMHyq0Q5EFMS/rzj/Tj7EOu+/MNFTZieLP684lXrlNTtXjW2w+65guVa7nLwfW+TG94sWbaHcszjmeNsHWqg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlMpiiPu; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47d6c634f45so2210026f8f.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020926; x=1784625726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ersi/mYvINkBI2FWvIZV+GjZx0POxK8U4eXz4ZcSu2s=;
        b=JlMpiiPuB/c2oZZrBc95DV5SlirlC+vI33zg0SPOc/HulQ6PRfzknxCCkoafPIpvrP
         /EJj/1KtO89mjrSwAg804DK5vh0COyxGNwuawFtnFZ7KMBigbh7Zzl57kK43Uc+sUCpE
         GCcqSMQeeV9CRff6mbMZEH7sAKA5t6q/8IcQVSdLwXCGd07VBWMpDWIVtj2UX6ZZVhsX
         0NgcdbBMpU5zzjkqiMRgF/+NQWG+NLTSjvp/R3LTfmwft2KTKXT4bD3XsaWvDLQ9qOGc
         i61iRKqNiiAd7ancftpI04EnANyP1jtq9AboinBkMGpTe2fYXFve0PE4fjxU28iAycwY
         oXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020926; x=1784625726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ersi/mYvINkBI2FWvIZV+GjZx0POxK8U4eXz4ZcSu2s=;
        b=cL9k2ayXtzTC8XhPjLArSBlaksvYtq/1KDM3UQ/yygQgBIp1doxikX82OZ5E72oOC3
         6xPVIU3CsOtiC6GLoV8kYWgwudOs8tnWqnnC7tN1RT8fWKYAlf8FNSsWqXkm2CkNAAjl
         rvZMdUkUq7mHP3ekdfMFl69MElcB1ucVJHlzEi5Sgzudei4KNbOfCeu210+zsZtmP8HT
         ujFCYoEFnmwGtZFJkgl8tGq58DBC4zrn+rRH//zINmi+zolpvNuFpR7MbjN1POdJwZdm
         8ycQYcuvk7kc+cE86RZCt6DuogdV/gQ5kowYSjV8uT/aSUut5G1kyoTFbU/kbs0/YEQj
         yoqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmEh+zY85aFc1VBUrc+l73+JzRuz4WJ6b4nZksalhBlYFC0Vgrbsu+rLwxihY8Vx+lOpQLbeBX07UBtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70gMtRJTtXLu4yTqy9Q7c3D5X+5+837uFIBLkiPntnDAM6lxf
	1NOjKyWAJnrMuw6oCnBnW591PY9w/9DXXoqzlZuu3nDzi6jTHPDef4ec
X-Gm-Gg: AfdE7cknh8ncCbB8tcTFmeQyPo9yojk3xcMir8a44OhKcErxxIGLMYuN/bgecJjz1Tw
	kuI7YmOUceqmQQVulk8mydxSBGlY/QAfNqbPEwsQzx9uyTZZof56hFZitkIKDQxEeiC46ZfVkx/
	gHRj5yf8rE8z4jtxf74d54TqQb6/K2JRMGJdxc13vo1V3ai+s3Wc7u5joLDXE9Wi5ccLg/eneib
	QobpgWQ9VD8ySpp9Yctl/B44Mr7orMCVR58tR2Bb8HjXI9a+hAvj5jfUWxTyaXhiS+gMvnahsj/
	ifyrWQAPoynBHQ8STTURgY8HQHDI0+m4sBxQvy9aTgHxz1W5CZY67sARy8QwObwKJjmTcWdIB9N
	2NLW7FFTlJ6MpLqhX72Y9CVAMHOh/O5v93AH9Ed82Iz759N6yDssWWzRKDXMvwyzLEUPrmks4+W
	uJbqyKtRKOHF8tl7kbCtr8mXfaIqk00HZEomCfc4Bjs/2+ukeaNxIuRaahkrzm6MhKqGKinwQIi
	hryutTBTzOa/l7Z6wWDZ9KGBu7gOpkSEGA+cWc8B7kGuw==
X-Received: by 2002:adf:e186:0:b0:475:6c34:2120 with SMTP id ffacd0b85a97d-47f4887dd78mr2004457f8f.18.1784020926324;
        Tue, 14 Jul 2026 02:22:06 -0700 (PDT)
Received: from [192.168.0.207] (nat-wifi0.uniroma3.it. [193.204.167.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f476e9d02sm6291743f8f.19.2026.07.14.02.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:22:03 -0700 (PDT)
Message-ID: <619bb771-1038-4ec1-8d4c-17dc69df33d6@gmail.com>
Date: Tue, 14 Jul 2026 10:22:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <20260713071828.GB30168@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260713071828.GB30168@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67548-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:kbusch@kernel.org,m:sagi@grimberg.me,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:akpm@linux-foundation.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:io-uring@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:nj.shetty@samsung.com,m:joshi.k@samsung.com,m:anuj20.g@samsung.com,m:tushar.gohad@intel.com,m:william.power@intel.com,m:phil.cayton@intel.com,m:jgg@nvidia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD14A752CBD

Hi Christoph,

On 7/13/26 08:18, Christoph Hellwig wrote:
> Hi Pavel,
> 
> do you plan to resend this series?  A lot of people are eagerly waiting
> for it to land.

Absolutely, I'm going to finish v4 next or hopefully this week.

-- 
Pavel Begunkov


