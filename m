Return-Path: <linux-media+bounces-59061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2khKDtA542lzDgEAu9opvQ
	(envelope-from <linux-media+bounces-59061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:59:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229E4205B7
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B59F83042D3A
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 07:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74259374E7F;
	Sat, 18 Apr 2026 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FE/IQyWf"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B4372664;
	Sat, 18 Apr 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776499139; cv=pass; b=lBL9ZqS3LIAa+HCREz33tFwdAacTVrSwdmhlPxOgSS9GqSdj9yXIEhFSFfaNqgG1gieVR4TcwPqdefiV+e/fNJj1YAp3pL9vH7p59vzm0AOHSJk2HmnEl6gMb0anEEWiJslVRClz/4T138dX/5uNQOC2etxFdAl+7RynOgBeUus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776499139; c=relaxed/simple;
	bh=oeJabYoyme4rE/G+I0nP/zUwd2uCLgMtpSQuiFcQIto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgtiEM/hWn+x7IuOjj71wiJC+AWVFTowfJRcRAuPNWP0WfarT+3LjhnpWbbPOO2I475LUAjwUGO61Ss1zNJWk3nMS7OMmJGFWfAQx9gCrfST2Bev7Ek3do1GEhq9GuEQNDCnJ5FDsWvhlRwAwjpxlhb6Agpxg+X0TXa5L8LFK2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FE/IQyWf; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyPJl3CYHzyR8;
	Sat, 18 Apr 2026 10:58:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776499128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X00w4i5D0ZnZKexaVFWAV0cqBlMwkVcbaN9RQWznw5M=;
	b=FE/IQyWfwHb0LKTUsXuMbeQDEUYQJrbQkelZzd95MqEybbupXqyMUiljJjDoheqFU/q6mM
	fgqNSBxYBaNWKCROa74MK4GqQd9/XXpcXXVgwHOEpUgiXHQxK/MCjt6MUJTMYruZIn9loO
	W/LCBaQesRnUrqEjcqDrd5yRz4NPtoI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776499128;
	b=g5F8TqRjAyC4ENkrHBdpsPt+6Cqso9uZ3tiP6jeXhEFYUSFvKUXAPYSje0ZULMlLS1fnJk
	oghHMOIcIvUNK/66TH7yrgQ37Hg0Vpu8pls/+y7zMe5FnL/tBO2BwbhD2rQiHeN2UkSzwD
	v3GPZkTXBdNX3hmroMC0K/jKgoQf2Oo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776499128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X00w4i5D0ZnZKexaVFWAV0cqBlMwkVcbaN9RQWznw5M=;
	b=URNtM/qEBhkKk/6/C8e8wMb595g54APoJi6M4olniCaOnZehA6TEXJf/vy+aYwxMkdNN76
	diSQjKrNw7bMPhGMHWR6NHUtaZDaELeIy8j1Jb59To1LkMOaKofba+dif4Jwnh159CQrhQ
	kIuXrxFHMoS8WyoE6Bfz9Vw075LlxOM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC848634C4E;
	Sat, 18 Apr 2026 10:58:46 +0300 (EEST)
Date: Sat, 18 Apr 2026 10:58:46 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <aeM5tm4wotNcFGZ0@valkosipuli.retiisi.eu>
References: <20260323141729.27701-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323141729.27701-1-med08elkadiri@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	TAGGED_FROM(0.00)[bounces-59061-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9229E4205B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mohammed,

On Mon, Mar 23, 2026 at 03:17:29PM +0100, Mohammed EL Kadiri wrote:
> Run codespell on the entire atomisp driver and fix various typos to improve
> code readability and searchability.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>

I'm afraid this no longer applies to my atomisp branch.

-- 
Kind regards,

Sakari Ailus

