Return-Path: <linux-media+bounces-16246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F84950F36
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 23:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C35B23B1B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 21:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BAC1AAE0F;
	Tue, 13 Aug 2024 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UbW+QwNa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+xg7bnSE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UbW+QwNa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+xg7bnSE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1E17B515;
	Tue, 13 Aug 2024 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723585136; cv=none; b=jjkyuUxfAW2y5o/5A9Q9DD/JAhRSS6Y+lTRurAiE5FFlpRr7xSMd/pWD7yVEv4YgJ7NzOwaPVbkoeeraKmfcPc242c9o+lYNIIKeoGj4eOL2uR3DMWzyLX78YQHYcfP8klgDa1sqXByqejJWaCvMip2QlsZLy8y36bWpwbKVPEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723585136; c=relaxed/simple;
	bh=9iKXwVoJ5E4Wbrn8BdfiIq4j9pWBgWl50Zmq3RudUbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZWB4PIHDE5b2o+nuw6jkC57jv7A+cEIKczFT+7uskZpQ5HuAifrq5byjQd+Js1mKNBk0VXNoDRmprJgcF+pGongpBZGmh/iuMoG441L0GyT5Hl/ECobZ3oamcA+ZnfEpHHJXNxBG/GVhfbmymAxot2U+aUd9gUTwI4hKyBEq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UbW+QwNa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+xg7bnSE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UbW+QwNa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+xg7bnSE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11F522261B;
	Tue, 13 Aug 2024 21:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723585132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eneo3/ifjbPg5RZh5p7VfUhYIE7MbBS6psghNR6gg0k=;
	b=UbW+QwNa7cSGVNPTfnu0eEpB/KUxdNhKuubEpXXrAel0C+nDQR+6QMfe8qxDcszakonwOt
	ali33wgNoJmPDoHUnwbtuI/FK6mEBbyulGDqkV8QUGTWJDl8liaMq4dZ6eV8XnoqjGnqpi
	xoXhmRvF3+r8aD5seEVvRKVjxtCW5rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723585132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eneo3/ifjbPg5RZh5p7VfUhYIE7MbBS6psghNR6gg0k=;
	b=+xg7bnSEPjuxXcwpx4go904CtHj9KdvGIuWp2ORtYLJ1ooX/t+LbOwchGWFN+pVLYnvGZv
	Dpixx/DLMGUqhMDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723585132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eneo3/ifjbPg5RZh5p7VfUhYIE7MbBS6psghNR6gg0k=;
	b=UbW+QwNa7cSGVNPTfnu0eEpB/KUxdNhKuubEpXXrAel0C+nDQR+6QMfe8qxDcszakonwOt
	ali33wgNoJmPDoHUnwbtuI/FK6mEBbyulGDqkV8QUGTWJDl8liaMq4dZ6eV8XnoqjGnqpi
	xoXhmRvF3+r8aD5seEVvRKVjxtCW5rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723585132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eneo3/ifjbPg5RZh5p7VfUhYIE7MbBS6psghNR6gg0k=;
	b=+xg7bnSEPjuxXcwpx4go904CtHj9KdvGIuWp2ORtYLJ1ooX/t+LbOwchGWFN+pVLYnvGZv
	Dpixx/DLMGUqhMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A8C9136A2;
	Tue, 13 Aug 2024 21:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +lkWI2vSu2aRGgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 13 Aug 2024 21:38:51 +0000
Message-ID: <3352aa92-6c50-45c6-b5a7-215e359bdf0c@suse.de>
Date: Wed, 14 Aug 2024 00:38:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-1-de903fd8d988@chromium.org>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20240813-cocci-flexarray-v6-1-de903fd8d988@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_CC(0.00)[xs4all.nl,vger.kernel.org];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com,quicinc.com,linaro.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl]
X-Spam-Flag: NO
X-Spam-Level: 

Hi Ricardo,

On 8/13/24 15:31, Ricardo Ribalda wrote:
> Replace the old style single element array with a flex array. We do not
> allocate this structure, so the size change should not be an issue.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Could you inverse the order of the tags, please. "Signed-off-by" must be
first and then the others.

All patches in the series has this issue.

~Stan


