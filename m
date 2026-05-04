Return-Path: <linux-media+bounces-60282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCxON2GT+GmwwgIAu9opvQ
	(envelope-from <linux-media+bounces-60282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:38:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478D4BCFC0
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A46303025920
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 12:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F7A3D34AD;
	Mon,  4 May 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="kynyEDEM"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F382361657
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898287; cv=pass; b=M69Eiyj06jz9VPoCfU5zf+/Z4+ubZ2qZyQtnuPaim9SqkiUCCR/Bim7jXlT9sWZ8WlsDLFl+JQT4znZd7yacRZwfnumW1AKiB4PnWhJa0ZmXwskLeMqq6MJVmK2+0VnJ6Xhh4ZvXGkD+o0N2D4sKfWpMM+ia3vuCk1k6ebI4ua4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898287; c=relaxed/simple;
	bh=Pe6Rxae0DLVPq6UqZNaB8+2POBiQBwiWn8koMzXY59Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBCeRkaNgBlKv13e6erZzHkT0JNNJLcS6IVHr7UxsMGgNZPsVvEE81zh3CxPKxMzfyR9yzLVLA1iqz7RY7cxmUfQYATw6I8TMjwA2jpUmi/YBmgadYEVN+Vrk9AsVUIvad8KruOhuskV9xEWdhHSt9Jtd4r5qx8HrRJxBPJEuvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=kynyEDEM; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g8LlS6xlWzyQL;
	Mon, 04 May 2026 15:37:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1777898277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEu9uiTF+Ms7cen1KtyiZZpL7mB7sMlvzSyM/6/vuGk=;
	b=kynyEDEMCBdh6Yk2A1YcVfnkgOiL0olJOCPX+Udll/n/QOMJERFvtatRPlM74Ul9KxZXuy
	oXS383z7ft5WjbK2loaU7OOl1NAh6ixNRrXJJ5pCKVn16nM74X58FQOoyNP4/nYfg5w3N4
	kh+RaV9JZtKzwvkdiBY0evVksiqIUr4=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1777898277;
	b=Bb+DHGWMRLBLrZQpG5fe6ENJs7r6lj4b0Q1GxdR+mPbx82tUuqMYf4HM85Q775n+pzaQUu
	Phs9TpwXZUFO/lIJMs3vct7bVTCYqz3uQzPhQ9fkeb2bvTV9UsFR710f18q4+SBcIFoH93
	mFNdEHUapWMhTLpC6LpcY+jC1epmGBk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1777898277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEu9uiTF+Ms7cen1KtyiZZpL7mB7sMlvzSyM/6/vuGk=;
	b=KxDGVzrEUnPOLb64iyQnLHt5N3/ld+yrsethF9/ML1lPWyVSuwQa5nyV7vTAjRi3iu/v+D
	NS1K9Tmzl5izOy4Sb+ztePxvgDYfFg3A5Xsg63dj8l3UGVgVwEdNy6IMltASW+1Fi/wjro
	aGo6KtadY8hwiZ2mowtCNs+bfDyzrvk=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 73BC3634C4E;
	Mon, 04 May 2026 15:37:56 +0300 (EEST)
Date: Mon, 4 May 2026 15:37:56 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <afiTJI8NEe4JTj0r@valkosipuli.retiisi.eu>
References: <20260504123503.417044-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504123503.417044-1-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: 3478D4BCFC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60282-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]

On Mon, May 04, 2026 at 03:35:03PM +0300, Sakari Ailus wrote:
> since v2:

This was indeed meant to be v3.

-- 
Sakari Ailus

