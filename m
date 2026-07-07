Return-Path: <linux-media+bounces-66871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EfPpAostTWrTwAEAu9opvQ
	(envelope-from <linux-media+bounces-66871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 18:47:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2871DFEB
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 18:47:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qtec.com header.s=google header.b=eQBqHDln;
	dmarc=pass (policy=reject) header.from=qtec.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66871-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66871-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 112BD303C4E7
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 16:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCC5436BC3;
	Tue,  7 Jul 2026 16:40:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083873EB10D
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 16:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442405; cv=none; b=cvNB7uUuCLaV8EeXVtItrTZ/gHUm8csqZpm4w6+4/OIjFLVe09AEoQJj5y15RNH5KTcsc5+D+lgLbTKFT8vMDHo4M713tiuTA36JCZg6DB90HRnZMDCVQQFG/fgweZP2qC1Nwsv9yMSuTg/SFlJnhcNgJTnr/ZipJKyd+BcxDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442405; c=relaxed/simple;
	bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hk1eBQW+P0kG6URbtY/5S46AHpgjyGXxtQzHReDc9jc3Hka68zmlDJMgrKsESaZqHGBOUcmxWUGdXVbBrhAcmPUAracDRSE/R7FTdw7pJQUzyMC27rv7k69rMq1AevzPR50sclB71fn/HsAHe1u5xsFNJG8wiLjlQAol/hcd/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=eQBqHDln; arc=none smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aec6360133so3303366e87.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1783442401; x=1784047201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
        b=eQBqHDln1HfzUDQDgL9i7Arg6YfeyuwFSpC5x4wN+DyBKhKT3ofLuqFoaJER+/CvDI
         VXjX0jKoyZ6+lwpgrZdjN2Sow2scsh3p3mM63aSoSKQ+Q/hfRb9U4FNYcDqtYFNBWNks
         VMFPXzVSyu8g6v7xWrgF6z7fqRqQhBzXD0He8ov5d1+R34qdYtVyyezhmDo81fbeVyT2
         4/wLPooJCmJE2w5s4JS192L8hyhrSw2GIlI1/Zpp3M53AYg091uVKN0Z2CnPDXergLZu
         SWC68cNRykCR6UxDXVmlHnzQayjgtSX95heG5shAZm3rPwKnet4LWtn+lO5pH18udiEF
         te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442401; x=1784047201;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
        b=BPj5dQD6EvLe78CiIU7ClKdHglYBLlTzo6JFs3+DkLFjriRtuxpPiXnF11a6uo828i
         vumy6VhcT8STHMJJetBlj+YrhtVOrS3jsH+TA05gDGQVlxuO8Sn7aYi4YTr6eNwS8d1x
         dze/U/+jM2Y8E4ZBLGwNs9EgTXy4nCC/lc9xxDTngeGozlvwOOSBTApIqFND0DVbcxvR
         r6ykBPWn4V3LjTmrlV4HM+niemdP/eHg4fQj0TP/ReF5I66njtjLSkY3lrBqswokHMva
         f+hjdNRSEeNDmngR7WmYLzwQS/FfR5DwziVKLQn1vxaw1tjwgbyI3LMw56QU4S5l0da4
         sTNA==
X-Forwarded-Encrypted: i=1; AHgh+RoDPTA7Rt91K07pDqF57BkjqnYY65f3FT731K37RiPTIdYzRDw6yOjRaU7rr/Lxj4F7eph/8hTeIcVzzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgbBRoVhfXiMDwdjcNFNr2TQP227OWfnNKuoDsvA8I2L2VuPE
	zr/AzhVykR64pEVXUlf1lS1lCC7sYux7oWfBxk/mzI5k9RMbVfRLP7Wd6Dd6lXlVdyNQXpD4kxb
	GKgXQIAg=
X-Gm-Gg: AfdE7ckFvs8a7jMnUCrqfF0YMn7STvzARq2KRXYZTrIsJJ/Y0IODb/DcYFCGGvaDu36
	4KUQbT2MZ9DfW/0Dwh/N7gWHTGwnoz0WTbDESxAI03UFT4Dw/lB7/HB3vaOY9XRBnbiq5UbtxQD
	d/riOjVJG3FnnQn8diWLYX+XbwxT1dIBzFwqhnnOo52y5j4CfYK9VY6NvgcANX3F26WeFmtTQpn
	pz+L4OUlH4Ho8Fw3j54wYrYdfaFvmVjn9Ahr3WtbugW21p1x8HgPcW2cTtTR8J/qEVObXx9CE/G
	kKjhVHy8YyUR4Xwmz9BNScR+xnkAxFHwOloNnO+7O92s5A28eEfPuz2sii4gFy4MUGgF3NMRJTu
	6HdXuv4qWnCRqLVhbHfz/k4IBX4hmBh2w3BmQEuoea8SzWexdXincQ+dA2lupnkRVlNYIJjFJBy
	vNsNJP0hgVyYZj/EeIsbVMhGKGsyLwlPX9kSjOpbP8AwXEFGoNNrDX/EPOygfpnV5gqhMqHFBZ/
	pQ1Q2fBDTSjGgUNv6aMTcTLQTrmQS2/VUQBf17266WJJYSLgIQiVBMsRV8irtviwfSMQQ==
X-Received: by 2002:a05:6512:6891:10b0:5ae:9d0f:19f2 with SMTP id 2adb3069b0e04-5b007b6eceamr990918e87.3.1783442400860;
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Received: from [192.168.2.43] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb774sm3864861e87.48.2026.07.07.09.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Message-ID: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
Date: Tue, 7 Jul 2026 18:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-doc@vger.kernel.org, linux-media@vger.kernel.org
From: Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: Bad wrapping in some tables
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qtec.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qtec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qtec.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66871-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dlp@qtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlp@qtec.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qtec.com:from_mime,qtec.com:dkim,qtec.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D2871DFEB

I've noticed some bad wrapping happening in tables, seemingly only in the Media
docs, but that's also where I look the most, after v7.1.

See:

https://www.kernel.org/doc/html/v7.1/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers

Compared to:

https://www.kernel.org/doc/html/v7.0/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers

Other tables have also changed, but they don't end up this bad, e.g:

https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

I've bisected it to be f2679ac773899f5fdea0b68d5077eef5f88dfd42 that has caused
the change, and I did try some quick changes to see if I could fix it for the
tables, but I didn't get any positive results.


Regards Daniel

