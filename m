Return-Path: <linux-media+bounces-55859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIG6GMq9t2mpUgEAu9opvQ
	(envelope-from <linux-media+bounces-55859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:22:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFE2961A0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ED78301750E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF9435F182;
	Mon, 16 Mar 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fffjYtce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851735E932
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649344; cv=none; b=ruO3aKTmNU6K8RVn8Kb/vzaeHMF3yBfhJX41LqOvc06PV2ijAzbdjSBBnp1BXux3DmdCrKoc+15dLKo4j4EU4Qj8od0uL2/Ayr1Udi3b1XLhDlN0Na1xqorpO6q3CQAZQFpq7oBN0sgDz07nUXbO790qBogzCLkZDzkMd90SOjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649344; c=relaxed/simple;
	bh=PCJsEz+J1XE+XBYcCysNc1i8G3nfjf5crAsgjEDE41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMKUciIYa/yr01E0BwdkO+rxwosF5iuPeJOkNKNqpA5PwQ4vPNS8o/rx4NiWxYjWmZ1744SXEIloO+37qscVxB8vpb1rDsrHaD9i2CwvmXwOvtQMNkHVAE2S0JeRS18IyBK9sMsVKdsmCBwDLvJjs1AT+PNOCGgHUWKYPxZBoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fffjYtce; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8df7620so3077192f8f.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649336; x=1774254136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=58zReeQcnxWpumjl9fmQoxf1aEM9cKDIz8JX3YceXSA=;
        b=fffjYtceee+78D/2NN8EDI37cg6Qj8GKeooLcevfMuU2vWhwclJMNv16BjeU+NIrVC
         y7gV6dHFei/8m9Ss+CE+RMYTWxoHPyF1fcSMx+eh+FcbzkEaQdHDK4uGp/O5oMiqsOQR
         zrFWHG3v4Hc1Hh0OAX+UGRrrRNz6iX0is31O8OrYhOzdNf+N3DbVSgRfFOqe1T6p7nfo
         xjdHDB/RWNvtBfkHMm9Us+tERzb/ojI1hNA+KAOjgvV2MmALu7ZWnbdiT6h+MiKhc3hz
         RcsaN++XIL6cjbYx5xhlQ6n1BZWauOxoixnlBATw93tiRBSIGfWF33Iapi8UZeYGtU+Y
         THfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649336; x=1774254136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58zReeQcnxWpumjl9fmQoxf1aEM9cKDIz8JX3YceXSA=;
        b=JnjAh9Yw54223Kc8u7btjzGooSVUCV+0A51cKfzZdL1lrdOLbLn+O8mnoxUUVmenue
         L0JNrmOqdmxEqyllqHLb045yI7ImxWMB1npfV39EINYcpVSLuKEMb9kTZaAVEv4otFah
         LkZ3qE6jLz67rLOFzjIjv/GcNtzJJ4zP+tFqu82vUFYNYagYskjnayE0MEawUMgS6GYD
         lD2RNeu1ulkgGTXV15IFur5d9bWHhz1VFLqBSB8Myp+YikeoPq7Z8ERCRLTusyEKM5Rb
         2MBDVgqPQN9J/7GTJe/d/miidskyBlyh+hvBw3qKrdE8YmfXvAPeeUB2MHXwXDbPfBL0
         09aw==
X-Forwarded-Encrypted: i=1; AJvYcCXXNHAoVsEgv6Ey7K2TnsaSkPEqLTSWay8Kv0lhZliP/V/w35e51kdIfmh7y7GSJP2XZp/V4EZ1PlEfqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8A7cONrdnh4yzfRmwGS46sj0ogISwtX7pqmMSC/tUDCxzeou
	pBxae4IWO1pDgNk28jskexHOer5AbWOxiFsLsnQPCp1gPbO3izMWK2SCjPtEJ1uCKFs=
X-Gm-Gg: ATEYQzyeMXDu7DYanpzvHPjDdnxYkiUy+NdOxbj5wMN24jaj+TqUjdMBUQcVE2Jo2Kc
	6IhKCxsJLp6pY+aq9FHkQklQohzErBxgWddwqT5htiqr1k3X7kcLbxNZ5Vdj6EmiDjVRWuRw0e3
	M21Hc1TuE1DlcaEFkeja0r8qFWy/eJKJPZq76Bgy9gjIvmPGVkpEeeAudsq6GFiMEv59h/e+IUW
	XRfHWJM0b5gk6MvmihCrcnAtrprTbOvwSi60zRg/qfihER0flsJe6oztD5jjVd+UHtsvi/mADZi
	lZJXB0GFEsnvsMXUVdmaJseTooDQ07IOwLiVAo8p0GAzTirCO9le5NX+x1DsIE/2dcvO77bv8Lm
	X3kdc7Mowrpk/B9kO6JuKcFDiWbkAVXlIJADWdE7dKGYEDM0KORMKcNsixdjtalpj0puyhAC4nS
	45Kfw6UoJlIexn7cBN/ASEcJ5+ooi+
X-Received: by 2002:a05:6000:184a:b0:43b:3f2d:7d58 with SMTP id ffacd0b85a97d-43b3f2d7fc1mr7707116f8f.52.1773649335679;
        Mon, 16 Mar 2026 01:22:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2617545f8f.12.2026.03.16.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:22:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: replace C++ comments with C
 style comments
Message-ID: <abe9tJq8F_lx6767@stanley.mountain>
References: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3.ref@yahoo.pl>
 <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55859-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFEFE2961A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:18:48PM +0100, Tomasz Unger wrote:
> @@ -314,7 +314,7 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
> +/* #define DEBUG_TIMING */

Delete?

>  static inline void print_time(char *s)
>  {
>  #ifdef DEBUG_TIMING
> @@ -762,7 +762,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
>  	u16 buf[20];
>  	int ret, i;
>  	u16 handle;
> -//	u16 mode = 0x0320;
> +	/* u16 mode = 0x0320; */

Delete this.  You're going to need to send multiple patches:

1: Delete dead code.
2: Update comments.

regards,
dan carpenter


