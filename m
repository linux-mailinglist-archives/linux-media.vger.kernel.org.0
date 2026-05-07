Return-Path: <linux-media+bounces-60833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECxhCJq0/Gm0SwAAu9opvQ
	(envelope-from <linux-media+bounces-60833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:49:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9FD4EB5F3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9F8F306525E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7605944D023;
	Thu,  7 May 2026 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="GVLOQ63P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFFA402B8B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168684; cv=none; b=Zh15tm3R51XeLT0HzHzoTP8dq2yGjvY64uZanYbFBa6PdfF1b3FhxZW6IYIgzdvVQlz5anw//V9EmiIPbcZPkrO0QNF7/i54ldYeyX8hd/uT3+nMtTj0Isi/aRME9f2f850S37j2gvXde36pTe5NbOaIHfDHOUlInYqL0TJATRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168684; c=relaxed/simple;
	bh=cGGWvD5y10fnVGUCLdNrEQ7ZRWU3MhI587OvGB8ykr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk08sjnh5K0A5b9TpLbr0O10LfVYqer4H5ZTfGmGlZJ6MCB12nbZt03PqSRhhlcx5wRK7j4g5NFForfgG14KBbksiJ9Lt499HPiCpmRnNAevsJMP/EvCM91+ZIMB4T6A4GfW+77kjciiFQ8LQfPieXLemMTIePFWilROJLb6InA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=GVLOQ63P; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.34])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2762A45A1D2A;
	Thu,  7 May 2026 15:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2762A45A1D2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1778168679;
	bh=OvDQFGRk3PYfnx93YFehGnLhI/dK+8SlJnqwBzua+bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVLOQ63PJB0AELWPOpmaajRqEl72w6l6zLQvOOBMwT9nMeT5n9qz0pHN8bis0cco3
	 bIGfdaII1i7U1UqDwwbJIrxrPAMgaPwh2bgE6GOe8EOayB/SLnk6uQFQYuf6ss/kWK
	 ZKAcOJu8fqaKI6aPDozvXEDQyVEru2MMBJ1SNn3Y=
Date: Thu, 7 May 2026 18:44:39 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, lvc-project@linuxtesting.org
Subject: Re: [PATCH] media: v4l2-ctrls-request: add NULL check in,
 v4l2_ctrl_request_complete()
Message-ID: <20260507183639-76b05beba77cab2faa866272-pchelkin@ispras>
References: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
X-Rspamd-Queue-Id: 8A9FD4EB5F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ispras.ru,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ispras.ru:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60833-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pchelkin@ispras.ru,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ispras.ru:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ispras.ru:dkim]
X-Rspamd-Action: no action

Hi,

On Fri, 01. May 23:28, Sergey Shtylyov wrote:
> If CONFIG_MEDIA_CONTROLLER is undefined, media_request_object_find() will
> always return NULL, so its 2nd call in v4l2_ctrl_request_complete() would
> fail as well as the 1st one and thus cause hdl to have a wrong value (at
> the top of memory) and list_for_each_entry() to iterate over the garbage
> data located there. Add NULL check for the 2nd call and place the error
> cleanup at the end of v4l2_ctrl_request_complete()...

another way may be to modify the stub version of
media_request_object_bind() to e.g. return -EINVAL instead of 0.  Thus
then v4l2_ctrl_request_bind() will return an error which is already
handled.  Looking at what the API implies, this seems reasonable, too.
Anyway, left for your preference.

