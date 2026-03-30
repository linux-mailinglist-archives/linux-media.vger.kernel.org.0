Return-Path: <linux-media+bounces-57580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMNkJx5Gymnn7AUAu9opvQ
	(envelope-from <linux-media+bounces-57580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:45:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124C3586D0
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F0B303CC11
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0B73B6356;
	Mon, 30 Mar 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6w+lIJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A23B582F
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863337; cv=none; b=HUFmivbbm0Y10UrKN+l9q8EiEZkJQRQv/UfSt6H3fVDa7ITfE2Gf7SPm2LzgaXIU7u4psHFG/r73ULlMkJcpGFQCOGL0sdE1nznHJQHnOJqIFwDa8qpcGIEIa3bjw5t10oUHv9SIcWb3o1jyPLMMyJMRaQ0bZdS1PG+FFlDcI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863337; c=relaxed/simple;
	bh=/THPjhtsCKvwzT/E0Ctzftz6Mn22zZmXPK0LI6tBVz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dsl5iQrLLjl7+Nbya34px8+1UyEkfguMUpcLasuOcxJdzqBeT8i3jh1v4Klq0dB4gZyHZf1AAekwUMLyEj3kYaL78ZErPy5fXMswYMwq7EoQp9G0LjcRM9H2WnjFfII/o50ylZ5omCBuIPP6/QpV/AxPYm9Q4Nsnh0joCTprmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6w+lIJB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso546784966b.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863335; x=1775468135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8icbgd+Gvc605wy+mpl63d77z2nXysg0+vXcRUSsPs=;
        b=a6w+lIJBSWF6YOwyG3CUPzfFtVBd/DCfdsd6smqr5axRN5ET+Am2NeFhF9isPOX81j
         oiLuynyh9UvGATUVhtmxSYHF0nwREl+myQdhaaGanlKixiS67+pnPe6rcU5qnlfnDk0I
         2PuF3CkWrsg6XrOxAQ3/zWrFy4vkF1zunJc7D3h1XCGz5qjU3qbLwPmA2czRbDFB2KpU
         BJaPOnqijAGwtRJ+cONiNCdd0EfiwiF9kfaXCzZJ5Mj1gKDOhHbcyD+o+bcwp9p+zuMi
         Yx3kSB05vwAbmDLS37upU9mRvBs3X4uYHXYwze2E2h+3in1p17UhKezrtLStSAr/Kc3e
         PL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863335; x=1775468135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8icbgd+Gvc605wy+mpl63d77z2nXysg0+vXcRUSsPs=;
        b=cCq7JrsnWxCYMI38C+cVibHdvM8Z7thMRysl6g5pnil9mKld9JXxYO6UaOT/g4gEoR
         N6P2m8d0Fcbl6u40UtBF/BsOb9FiuoYG9sRFXB7OKXupUqB9QAiHXVJIl4399DBqoIjS
         h7Ine8VRQxWqN4URQXNYxt8hCXY+ZNvefkDhTQwtcqufiL+ipbdA4IWK0/CQefoUfvzT
         4KcVouxk9YnXOJQhovblasAotjZggL4rDaonguVWIUXcyylBJUu9mIy6j39CXprZvk6M
         TWzB3r+XkT5W98ySE+quH5sMzJGqhQ0M3VidkXBADy/9QMakDC39/Q0dV28jH5Ff1G8r
         4fnA==
X-Forwarded-Encrypted: i=1; AJvYcCWfqIN+30qYQwWeA4rS7du1arlC9RuRNBP3qowrsyQBGCH2uye45c/K05c9XGDr4V6tX5SYOtZJVc0Ddw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypWNxNb1aY6sLtjiSC3eaZqaTvAaWnCPruWPre4cSJwagZN2er
	vJ1KIFdRp9t3lfuRIw/7jQqXwxBzIy7MPTU/I+2HBBXvSX6K6l+kXfjr
X-Gm-Gg: ATEYQzwcsEljoiFVkgSdfvzqwvLE9zOPCctrm31iFs/Cd/w9xARwiNj7sVgOGgbVgVO
	AOaQ4qrZ0x+asPxZAqrG2YkvRKbdgGACXzIByRxbBkRCkgPrHvyB7PDr62R1B7TCzj1TaHbzO02
	YadYcAfufHVIVMLdqKK8IzqSuD7QNPxr+71bY/9618aK1gB3fb7kOs3Vvqm2Bq/8tI6GCUe4Nab
	VxwVITlvkwTqK2rAL5kGUrUrSg4SwnvlSa6Fav5TzMyCFzkmzB1H6hN52LOWdqIaOREs6WRwxft
	7M3DDDhGBZNB3p4+1N9+NQ7/T+3mIxhT6MGDCv7i3xawFpNwPOvt2pF3UdvquexQjik3MrykEo+
	B0Qfjz7UhhXRqOe778+NXONep9kqKZJbNOWj+7oTRtb5Tp/7YJkU9tUI1B4YE65jASkbcslG2dh
	kE82Ya/RhzolrjgT4ytbvztwL8xRJLnQ==
X-Received: by 2002:a17:907:93c2:b0:b9b:1f3e:fa56 with SMTP id a640c23a62f3a-b9b5094c45fmr423164866b.45.1774863334604;
        Mon, 30 Mar 2026 02:35:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a65c2sm268002966b.34.2026.03.30.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:34 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <acopy6nyxSb16J8N@stanley.mountain>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328192721.255493-2-azpijr@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57580-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0124C3586D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> The function configure_isp_from_args() incorrectly dereferences
> args->delay_frames[0] to configure cropping without checking if the
> pointer is valid. However, as noted in a FIXME comment later in the
> same function, delay_frames can be NULL in certain pipeline
> configurations.

The comment comes later in the function and it says "FIXME:
args->delay_frames can be NULL here".  "args->delay_frames" is
different from "args->delay_frames[0]".  Obviously
args->delay_frames can't actually be NULL there since we
dereference it here so the comment is wrong.

If the correct response to the FIXME were just to add a NULL
check then the original author probably would have done that.

regards,
dan carpenter


