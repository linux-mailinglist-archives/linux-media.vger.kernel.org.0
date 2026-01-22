Return-Path: <linux-media+bounces-51348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB+nFVYTcmksawAAu9opvQ
	(envelope-from <linux-media+bounces-51348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 13:08:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0B666B4
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 13:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1B69741E43
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9474F36655A;
	Thu, 22 Jan 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nljiXZaw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCC1DF97C
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082427; cv=none; b=D2NOW9tvc56A9dgfBMHtZkSyWyDZ4RhxrzpNB13hEIYpZQ/AyqJ6NzTEi7pLubvYC7Lv+QUjXluSfAdeB08h8holDT+0oS3ms9QDkOg04RGCfgVsO5JFSzAaTGdRdOJE9t7gdy7H9zSZclRHKY9BjttJWSj0ZL9qrCgcMhiQEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082427; c=relaxed/simple;
	bh=L23kP1MKIlxxrA/vTdHehDXUOocxzJrIy3gu+khhV+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=px+SxuHpkad/fLlRGVXXB4NhK7w788D1bCknCyNDp2/fu/8TME5KKjA+w+KTGOm8DwbKV7PzqQpBiaPioykI3+YDE9S5Zig+aUYc7p4IWkowahZOWxLDZ1Kmh+gpHqG1YZ5MCqzlI5On0aa8c0HZV1255uVEdMn/bFShs2Tx3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nljiXZaw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359a302794so574515f8f.1
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 03:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769082423; x=1769687223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/c04FssyRzWAvFZbUZZ5iSwy4KaO1b4NaDQ9GK8JLME=;
        b=nljiXZawh5QxydA4lbo89SOm6Z5RduUhSqUBtra9we1Svfex2VEIf860MZoiYSNwow
         Q7dTem3yaRi1Pm57q/7He6mqWTLV55hH67oAbdm8VybY0K95d/umdKxgRfgJjj/ReFQd
         peOUFEAhJji17Q4l5c9oqDNwEjfRdHuPZ7GJ1rTO6/qCPaCDnmpnF5aQM0HtHerG4Ljv
         ccfpfM37hGbhRqBlN+54iBu05VAD1kreB0csgIgVM+xW3c6rOhHZScVQzYMjU6silAOx
         xWBcUQOsAmsQtVBgbhykOCRtAhr2ioAbGwk207natgOb0+EZLQlj4GIQ94Pjf+6/MvxK
         ccCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082423; x=1769687223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c04FssyRzWAvFZbUZZ5iSwy4KaO1b4NaDQ9GK8JLME=;
        b=L8BtypB4MGEI+/g7ImVVeSlQfrXDRk9aZuojAPm5mk4YuBwqjNyy+TeF01m4LY5zzF
         BHeStutipqRV+ouMtBRfP+jEmMsMsXPUWN3s5q6zUUb6fkACzwB+9IDTVNVAdTFz9jPa
         2Hf4p5udJo6pJWYbUrFPNj63PyVOP8DqlLyUixOvWU6Gp9vok1puKBgwLw99lOcC5t50
         dxMA3P2WrVOVxDtmdtJSHlRM9T0BO8o2nxslilqHidFNcKQ1/q0OlxU7wApFqCvqAEN2
         aChPcnO+AkBQYYaXGW8hzq7oRhJ7JdJB6R9uowrfizc5aN/jJE4nsAYVXXqPpOZzrzAp
         qWnA==
X-Forwarded-Encrypted: i=1; AJvYcCVyBKEZ67j1BBaGCk5+EJqoNpyRlkP0Eg0winVDMtq+Yjno74xYB2biD4MhtP9iwW++9o4NJ85pv2UO/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuT7TGvOeDivtxOOq+eNLP9eiMiVKDbm8lMniWeNXwZyKvLB/G
	UEcuxBpOFk1UydzsE+KnbYzViuRqJaQZTYpuh3J5r6HcT4RtiKSrRwOY
X-Gm-Gg: AZuq6aJe+4jeSSQcpHipXeWCr7yhF1if1o3xkC7eLh5qsJkDcqGJQ10uQe9vZ6KX6/a
	tOvjtJLqfrU490EHM2xoD91UHW+84VgOq/HF2dmZV46+5/NmBSI8WJU9DHctXKcaw7SGinUjy0b
	D9TxoSoVodmMQZb1SIz8MQX1dRGP4HTAme8c3DXvMsfpto6dOC9Q5S/7fEpCCc0NBVSPZygAqEQ
	48ShrqtcnryiVPC5+3l8ztuS6QGYv7jdvpE2Pysow37aLmv1TPTZGv9HCobId5xvEg94KDYIPIH
	QtKqZ13kHBz1efV8gL2W5EEQkGTwqfnIAgzFX8dKcbHwh1CT39LhRRniCEeGxkuOF2YJgSo4jLT
	2zppG3Ak7s+PQOhmhsQauVF3K5ncN2SfVP2G8PHqSxOFtlv7QsdOzOkbZsJ+3cTsvsizHyTRdrc
	pM0GOmLpbzJymaIEp4pCPixqTcq9jknh8+Stjw24D9gQNYCjwaTe+492bIeRqE5t4ZXT6LD8b+K
	aitc5vTzN8JvcbcL291soKaatF4I5esI2HflPNYo1uuEeI=
X-Received: by 2002:a05:6000:144b:b0:435:95ce:836e with SMTP id ffacd0b85a97d-43595ce838amr11818024f8f.55.1769082423045;
        Thu, 22 Jan 2026 03:47:03 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:46c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f138e26sm19447555f8f.17.2026.01.22.03.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:47:02 -0800 (PST)
Message-ID: <d3389449-f344-48ae-ab13-697e01d1cc46@gmail.com>
Date: Thu, 22 Jan 2026 11:46:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
 <CGME20260121074135epcas5p2eeb621d6acc9b4b73e6d45f5a40c078d@epcas5p2.samsung.com>
 <20260121073724.dja6wyqyf5apkdcx@green245.gost>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260121073724.dja6wyqyf5apkdcx@green245.gost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51348-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: E7D0B666B4
X-Rspamd-Action: no action

On 1/21/26 07:37, Nitesh Shetty wrote:
> On 23/11/25 10:51PM, Pavel Begunkov wrote:
>> Add blk-mq infrastructure to handle dmabuf tokens. There are two main
>> objects. The first is struct blk_mq_dma_token, which is an extension of
>> struct dma_token and passed in an iterator. The second is struct
>> blk_mq_dma_map, which keeps the actual mapping and unlike the token, can
>> be ejected (e.g. by move_notify) and recreated.
>>
>> The token keeps an rcu protected pointer to the mapping, so when it
>> resolves a token into a mapping to pass it to a request, it'll do an rcu
>> protected lookup and get a percpu reference to the mapping.
>>
>> If there is no current mapping attached to a token, it'll need to be
>> created by calling the driver (e.g. nvme) via a new callback. It
>> requires waiting, thefore can't be done for nowait requests and couldn't
>> happen deeper in the stack, e.g. during nvme request submission.
>>
>> The structure split is needed because move_notify can request to
>> invalidate the dma mapping at any moment, and we need a way to
>> concurrently remove it and wait for the inflight requests using the
>> previous mapping to complete.
>>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
>> block/Makefile                   |   1 +
>> block/bdev.c                     |  14 ++
>> block/blk-mq-dma-token.c         | 236 +++++++++++++++++++++++++++++++
>> block/blk-mq.c                   |  20 +++
>> block/fops.c                     |   1 +
>> include/linux/blk-mq-dma-token.h |  60 ++++++++
>> include/linux/blk-mq.h           |  21 +++
>> include/linux/blkdev.h           |   3 +
>> 8 files changed, 356 insertions(+)
>> create mode 100644 block/blk-mq-dma-token.c
>> create mode 100644 include/linux/blk-mq-dma-token.h
>>
>> diff --git a/block/Makefile b/block/Makefile
>> index c65f4da93702..0190e5aa9f00 100644
...
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index f2650c97a75e..1ff3a7e3191b 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -29,6 +29,7 @@
>> #include <linux/blk-crypto.h>
>> #include <linux/part_stat.h>
>> #include <linux/sched/isolation.h>
>> +#include <linux/blk-mq-dma-token.h>
>>
>> #include <trace/events/block.h>
>>
>> @@ -439,6 +440,7 @@ static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
>>     rq->nr_integrity_segments = 0;
>>     rq->end_io = NULL;
>>     rq->end_io_data = NULL;
>> +    rq->dma_map = NULL;
>>
>>     blk_crypto_rq_set_defaults(rq);
>>     INIT_LIST_HEAD(&rq->queuelist);
>> @@ -794,6 +796,7 @@ static void __blk_mq_free_request(struct request *rq)
>>     blk_pm_mark_last_busy(rq);
>>     rq->mq_hctx = NULL;
>>
>> +    blk_rq_drop_dma_map(rq);
> blk_rq_drop_dma_map(rq), needs to be added in blk_mq_end_request_batch
> as well[1], otherwise I am seeing we leave with increased reference
> count in dma-buf exporter side.
> 
> Thanks,
> Nitesh
> 
> [1]
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -1214,6 +1214,7 @@ void blk_mq_end_request_batch(struct io_comp_batch *iob)
> 
>                   blk_crypto_free_request(rq);
>                   blk_pm_mark_last_busy(rq);
> +               blk_rq_drop_dma_map(rq);

Ah yes, thanks Nitesh

-- 
Pavel Begunkov


