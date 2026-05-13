Return-Path: <linux-media+bounces-61527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKpWJtbbBGrYPwIAu9opvQ
	(envelope-from <linux-media+bounces-61527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E680B53A637
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1E0301E3D1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916093A4F5E;
	Wed, 13 May 2026 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YikkOWaz"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193FB3911C0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703308; cv=pass; b=smFh7OSQXJ52Xg8WhPzXJ+hlXUIR/IQdnvzl5ZTbZ+R8Ik3ZViOTcywvsehiWWYxq5KMzO/ML8SjYZQPPt4PiHDDe7b9zLQgRh3aFcm+q41VgDtWsRr2yDll1geWzhEqKrWaR5mWeEF02heuzYwzaENlsbCTfLWwSQWN3Q8EncM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703308; c=relaxed/simple;
	bh=pAxUL4aaS+4lWDQ9ZKxn5noO8k1JExaLYzTAHxqXtEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q72+Z+zuFRMIuVNPbLpIx8RNP3nSu+wSSbbXPbQWgxz1/rrtIlAuwn3DJuC7Yvmnr+FA1kuEotRIwcosvuIQutcUqPqTqunyuuBiEFbd7kh+KpPKOFdYk5pQ/yY0+0mY+sYUrLz91vegRuPQt+Xpfm4I9r22RalX6CiP5mg4C8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YikkOWaz; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4gG4Sf58ZYz49Q5j;
	Wed, 13 May 2026 23:14:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1778703299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OBGRxkYnqFHyVgmTa0u1R3d9AC2SHsV78GuVjV3mQcs=;
	b=YikkOWaztbZqZoCGraM5d2FHcY/6ognpjqNZawj2lwUK/32EwPmTBnMJ0iE/osflHTNlHj
	Aaei9ZTBNTEAlSm/ao/CdKtyeyA0sHjlhjp44N4QZo8m28xKBOBsTWdcjZu5mLJFbjvHHW
	fUjz24JHnBfZlE966tgcMvz+4DMhuAN1InTHH5xS4dYXpM48uW8S3dVdjV4ncmotrXBqCV
	Pj2AsJC5XL/K1j7xAQaCrGPlnqSCNmZtfqhl3TkK46UqWszNtPv8Z4Yj1yHFHe7eDY3CDt
	hC6jllfwtrHVCQI/ecv62B+vTxtjZtab1ObidDHXemmT3Vp1tWaAHKvZiZZQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1778703299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OBGRxkYnqFHyVgmTa0u1R3d9AC2SHsV78GuVjV3mQcs=;
	b=IdpS3CFf0Ld6h0bu8qRrKYpRo5MyTGxY32wmXVmniTu1W5f4rrbB2IERjnYQWAbBYQSaYQ
	Nu4KTZurUwYMPZzCH4lA01UaNFiXu7EP91rhqh4gGDW0R1MvohrE/ZkWG/LFttJLMh7gBG
	+mpu9Xwvp6sgyJxnoTxBRsW6mgSRSo6mBb/x0neiGj9GAPf9/k/k734b0q4oVdt1HXy6sM
	W6vriZgrTVfVGj/iWabEos6L/0SUSh2Ia0e2JHn0/xA4sN+iNdnqdZ9xdcnVqqk7E0YoSh
	a90/MxBOKQTBIpSBEZWsNYVpgwBRYOXz+mXMiRLwiNKp03w7Cv7Qi2XNEN4w5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1778703299;
	b=iZIthgt9aRxPoO0u5tmHgvoLqNIsts3/IdGErtTiSKAkX+yteMRky9ikkxKgnRCzoxzfWP
	LEbagSVriBO9YebtNx25xVg/V7e0uu4RqruHs8hn+jcq2lzy+fQQPYEWc5OSoi1jcYWFJD
	Sgs3y0lZzoBBLuPkE/0hJ/gGc1o+5IVrbdqVbyqp/PL1zWhRwUvrUvb5z+VKNHq7WdHJA0
	PX2LmXO2790Vf3I6hndk929bCtmqy/OyJprdKtvy0ylzfnp/WJ6dOeDO4tjhs9w0oJyQDS
	5C2OAo0Cr7CzUJWUY8Ej+PK54h5IJh8prTfoKRMXAfgjrdGWLRpzDp28ScIXbA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 339CA634C4E;
	Wed, 13 May 2026 23:14:58 +0300 (EEST)
Date: Wed, 13 May 2026 23:14:58 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 00/17] Rework frame descriptors
Message-ID: <agTbwqUAVcQytGB2@valkosipuli.retiisi.eu>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: E680B53A637
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	TAGGED_FROM(0.00)[bounces-61527-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:41PM +0300, Sakari Ailus wrote:
> This smallish set makes frame descriptors dynamically allocated and
> implements a single-entry frame descriptor based on the device's format,
> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> do not obtain their frame descriptor from upstream are converted. The
> helper also obtains a frame descriptor for the desired type (parallel or
> CSI-2) and checks there's at least one entry there. These checks are
> removed from drivers that currently perform them. (Some drivers also check
> there's exactly a single frame descriptor entry but I think in most cases
> this check could be loosened. That could be done after this set.)

Please ignore the driver patches for now. There are some issue remaining
which I'll fix for v2.

-- 
Sakari Ailus

