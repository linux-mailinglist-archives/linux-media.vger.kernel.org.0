Return-Path: <linux-media+bounces-61944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIBkI/DtCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:46:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848756AEA5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 970753070CF7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D523ED136;
	Mon, 18 May 2026 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFtHjJDu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A03EB7FF
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100273; cv=none; b=NqpOWWFHRxLJuKgrS7d9FXgfPvfaIHfaWyZDFJkCiTSInZMhgfbxMbtNGsdMEDWRu0SJcVQamnG4b4hHel7U1UEGkJA2UWvviRzdUDqq3DqJHbi9ALfjHQuKcvHTm052Od7/fSQYH8ID2X6QGhgWBFc3/yrvtq8SlBAddLmdzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100273; c=relaxed/simple;
	bh=uNvks5nLVhab845gPs8D4jnOry1W6hE6xPWWd9nU+CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S96uZtyONy61S+kXVxoVp79lcmjMHERVXx1mumSUw5MA7B0mjqLOQoUj2qEXGrUIzG/QAjdImlsEszstX0En9fmXxJf0sFzUHOGhdQtrBcBhwEUKShmTnJDQLc5MvMatdBu3vHUcHoHgtyHUHaJVAhl5U1kCMnCZZbTu6bRBn90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFtHjJDu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso5161839a12.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100257; x=1779705057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hx27Zr2PfQkgYP6DocpvbcVC/5/Kjswu2b3jiJPzVQY=;
        b=SFtHjJDu5+thx67ZQgSBSlnzrWP8St/IsgqvFJBv+8gm1ZrL2dyXiR9tOuiCjTHlxK
         leC3X5LwO9ivz6GpTCXdCkORR5nUXpH3H7zydiX32uINNdws6VGv3HNPz767MpzZyFLv
         CwtfM3jnULTNL8ABAm8hoRo8Gid93oQikbr8Xq08xamILO2ehZBd0oG56QxnAvJixFAt
         w6azypF0dMLXHB6c7c0334C/m+OJ2yS/GGsT+E/iEqTBoTUUM1K96VkKyWLbFWOKggQK
         i0EgO1KZSz8N0Ht7I8I199PJpHmud6anBnAwiAxTKU6aQqsnKb7fdI6vF+DEf3UPLiaQ
         +FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100257; x=1779705057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hx27Zr2PfQkgYP6DocpvbcVC/5/Kjswu2b3jiJPzVQY=;
        b=lNH50OjUUszqrYoaar1U9CIzRpiWmUgs170NWhwoChuJbVOChQoCReHyn3YC6hi8GP
         y4fLXM+7wgPxcSZeXtoSHJU7WlLaKOFdIqeM7q2grTMcU5L+U2EHkN3MglYVdQEarcOQ
         J5mOiSeZ1GUEeYCAtUIPGNG7dPxdpQG+3YSTuNxkKyUaSXPOMMrZdiaYlimIyA3OjP3A
         qy4k0FnynQ7DG07EXeofdBqAn7+gvjBn9l2F7MgnUmPnJdYf+yEoCLuEIRszR8cIjlv1
         QFCfwFkFTEm7yte+OjxFHy4mFkF+HOwz+WYgQwsoGTWPrWXf7VEZeWVWO8XX/5UzQbFw
         bcig==
X-Forwarded-Encrypted: i=1; AFNElJ+uH6qLq9/vSFnB6KjDx+ewx3570Sfsh1QZ/pn+z5iIf6K3zLmzuvWbqVkRNXT682FfV7cGC4xu2d+Lmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nu0gZxah2NWPw3HEocI1wOdKCcMDk65fxgwTdMhneS4Vlxl8
	o6ITz4giUbbnn9T9YE8E5gLhq01Q3+Rima5ossZsxR8Qgbj2Zs9lChEt
X-Gm-Gg: Acq92OGKp6QmT7XdujR60UTJS5s5In2F2hhKdMe3T3Eo6bHqgd1xD4JMRIcbfQtiwus
	eQLDfodRNl5mUA/9wRiL27xPnutmDlx+tNYZxtRXeVYnm5jOr9rhMK2v13NJqSn9Piflgs3oE/r
	gd6TjjhpzaryKHPL7ySozsp7epJDoyTrTv1loj45XOGnqqfpQLdRSNKQcy5lhbOGfZoCy3ihgi8
	7Auik4UULIbnkzBFjVeFlq/AQ4C0AtObDQHzcCRzqMs4TcuOl2l72iXMhEn/BzsnEDBk0L4xJhl
	pWZOX6fyjBO4K7N9HugWov6eA7qd84EjY1Ec13UYtsdplageaezAlyY2U5cElb1AdwC9Dt0CMOh
	ApuA12UeXOwu/abcQfZqTBwmX2AZ4n0vcHoIzNoSm4sq/2dEsUWDgmKWAKG50vSMekK/Ndz0dGO
	cUBYlZhiAmpZBUFMK1VN57Zm5lI2pvOqWLgrWCAPJ6XiQdrDchH/Atlzh2FrfDPjbJS7r3LBHFl
	cn2axhAfOhvFr44ZS/mVW4cjOlK3Pi+/wRRgSbkwNRWXbpiaAA+te3xUdU=
X-Received: by 2002:a17:907:1c0d:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bd517a99797mr714341866b.35.1779100257041;
        Mon, 18 May 2026 03:30:57 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:ec20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e4d54dsm542055466b.47.2026.05.18.03.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:30:56 -0700 (PDT)
Message-ID: <574f42cf-0d72-437a-8eba-fd970011e206@gmail.com>
Date: Mon, 18 May 2026 11:30:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] nvme-pci: implement dma_token backed requests
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 Christoph Hellwig <hch@lst.de>
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
 Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <5cecb1157ab784f9f303a91449fdf11b03aa6002.1777475843.git.asml.silence@gmail.com>
 <20260513083817.GC6461@lst.de>
 <CGME20260518092930epcas5p30d3b49f26efa5969ddcdb15351a886f3@epcas5p3.samsung.com>
 <50ed7240-d8d3-4816-bcc9-ce8adbbbf841@gmail.com>
 <f9e04625-50c6-4fa9-8b12-76496e29f10c@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <f9e04625-50c6-4fa9-8b12-76496e29f10c@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7848756AEA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/18/26 11:18, Anuj Gupta/Anuj Gupta wrote:
> On 5/18/2026 2:59 PM, Pavel Begunkov wrote:
>>> FYI, I really want SGL support before this get merged, but ignoring that
>>> for now:
>>
>> I was hoping to let Samsung guys to send a follow up they already have,
>> but I'll ask them to have about taking it into this patch set.
> 
> I had done patches on top of v3 adding SGL support and PRP list reuse
> optimization for the dmabuf path.
> Branch: https://github.com/SamsungDS/linux/commits/rw-dmabuf-v3-nvme-opt/
> 
> Also pasting the SGL patch here for quick reference:

Thanks Anuj!

-- 
Pavel Begunkov


