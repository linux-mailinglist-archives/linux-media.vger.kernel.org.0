Return-Path: <linux-media+bounces-20928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B79BCC50
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85285283829
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E891D514F;
	Tue,  5 Nov 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KnaKUJiO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY9xu9ws";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KnaKUJiO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY9xu9ws"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11CC1D0498;
	Tue,  5 Nov 2024 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808273; cv=none; b=go73HPO4wMqcVlbMQKg5qGp2myPMU/k5fBGxonVR+BrnJ4IAsuMuo+s/wgT8NPJmb59kezj+hT42nsbuQQ1NEgPombFzCkxcjlJYDDbH+uwIHqKYZKuaaUkPsSH/gVGftub3dEr73uywCToiWMhNhpK5O2Bw9ETK2mBACSi2h90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808273; c=relaxed/simple;
	bh=dMW0IPIpHpU9qevywTzSDicdiiMZBgLKfN7d0nrwK4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpesLDYRAZrro5bXiIGEI+karUOT4+kSb5N/wxbJPhw/6jZeZSbeUCiIjUh8VGIs5iDErsnsEC/v6Dtxf0pzoS/n7w8I48KMRl3KxdOUpBZLQglEq0QSxD/+wutiP6v3mORDSaPURQrOmeyhV6Uq6KTQf+1wj2WTBIg9L3CkXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KnaKUJiO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HY9xu9ws; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KnaKUJiO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HY9xu9ws; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41EE01F83B;
	Tue,  5 Nov 2024 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//kd9UV79ZTkwZjwg3vGI+RyGG2rrjEezbEk8U2guic=;
	b=KnaKUJiOjG9D5HWGGVf6nd2FzIM4WAs7DhE6cpyRDReSEinfbIRoXeW1eR2yw79VwMvT9h
	P2+0KB+qMWYPQEmH7KO5Ei+h3Q4VrvVV5cOSktFgtbxHqOBG3qtqWJfnwhZz54YWteU/+M
	Bon/aaaV+HsJpFlsQDnLZv3mUkMxaaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//kd9UV79ZTkwZjwg3vGI+RyGG2rrjEezbEk8U2guic=;
	b=HY9xu9wsuXiG9yJPRjesnSuy0AKUwmw0acx798Qyv2AI8s6D6QdhCKiBurW3K3DZ3Mj1xE
	1dScrXzhYLYQOJBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//kd9UV79ZTkwZjwg3vGI+RyGG2rrjEezbEk8U2guic=;
	b=KnaKUJiOjG9D5HWGGVf6nd2FzIM4WAs7DhE6cpyRDReSEinfbIRoXeW1eR2yw79VwMvT9h
	P2+0KB+qMWYPQEmH7KO5Ei+h3Q4VrvVV5cOSktFgtbxHqOBG3qtqWJfnwhZz54YWteU/+M
	Bon/aaaV+HsJpFlsQDnLZv3mUkMxaaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//kd9UV79ZTkwZjwg3vGI+RyGG2rrjEezbEk8U2guic=;
	b=HY9xu9wsuXiG9yJPRjesnSuy0AKUwmw0acx798Qyv2AI8s6D6QdhCKiBurW3K3DZ3Mj1xE
	1dScrXzhYLYQOJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4E0313964;
	Tue,  5 Nov 2024 12:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V+l6Mc0JKmf5cAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 05 Nov 2024 12:04:29 +0000
Message-ID: <37a906eb-4cd1-4034-9bf6-2f9f4560b9e3@suse.de>
Date: Tue, 5 Nov 2024 14:04:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 0/3] media: venus: close() fixes
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241025165656.778282-1-senozhatsky@chromium.org>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20241025165656.778282-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com,quicinc.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi Sergey,

Thank you for the patch!

On 10/25/24 19:56, Sergey Senozhatsky wrote:
> A couple of fixes for venus driver close() handling
> (both enc and dec).
> 
> v5->v6:
> -- added kfree() backtrace to 0002
> 
> Sergey Senozhatsky (3):
>   media: venus: fix enc/dec destruction order
>   media: venus: sync with threaded IRQ during inst destruction
>   media: venus: factor out inst destruction routine

Could you please combine 1/3 and 2/3 commit bodies into 3/3 body and
resend the new 3/3 only. I do not see a reason to apply 1/3 and 2/3.

Also, on what platform this was tested?

~Stan

> 
>  drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 ++
>  drivers/media/platform/qcom/venus/vdec.c      | 13 ++--------
>  drivers/media/platform/qcom/venus/vdec.h      |  1 -
>  .../media/platform/qcom/venus/vdec_ctrls.c    |  5 ----
>  drivers/media/platform/qcom/venus/venc.c      | 14 ++---------
>  drivers/media/platform/qcom/venus/venc.h      |  1 -
>  .../media/platform/qcom/venus/venc_ctrls.c    |  5 ----
>  8 files changed, 31 insertions(+), 35 deletions(-)
> 


