Return-Path: <linux-media+bounces-9854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073B8AC9DB
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F671F2146B
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535AE13C9A2;
	Mon, 22 Apr 2024 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="DQkj4Y8p"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259643178
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713779510; cv=pass; b=MTjLwOdEpg5QN6+ypOYxFAMw6kugy5RdPbpf7unjNt8nBgtQwudomCHNm0uU/FFt7dRduFzkNJaB+YxgKZQ2Y57Q9hDFsEDKisBGHgt+9msFHuZFOb1bpO1rYGF+r2eUBclA7qL0MtMdLMD04Vcc+qqG2sbkrVK0cQc/CHm/mXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713779510; c=relaxed/simple;
	bh=eHdXKbAeu6wKoFTz1MRxrw0SIuotbMPB/fab4H6wOb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhpDlXVS0kM/7h0JZ0WDGzwL7ha4KerqgXxK3KCHrnwKnvCdmi0SareHQyPACaRwgwdK1xQUzwB1jK4pp+Xvki9fcExcMGQ9InbeE+ZMzut3D4/dQdmX73Xnu/KU/ZJPK5uXkaaUVa9nFkdarCa3xnCgJjUVYv3A5Z1ia2cDE3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=DQkj4Y8p; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VNLB94lL9z49PwQ;
	Mon, 22 Apr 2024 12:51:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1713779505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZaSy7FVbJoP4EX49cZLKiqu8pCbvcbD980UkLRZkgY=;
	b=DQkj4Y8pewIk3jPBcCCsh8n3GwJz4EOYQ3Cd2x/OjmqqRZpUT8UUK4hIAiPj1FmQaQ85dN
	eT1zaz/mziXgwe13no9xdlLcJyo4zXmr0dRuCkowC7FrDQYo4El2XAOa7PN8UFzfG7CHpB
	l6UFNB/D3u0ck9Ts3Wx9vNJDHOPXsyVCkFhqVewQOY8pUy2UpYDJayPJw3RF11KbcAbqW/
	y1W4ajzZv7AUZ4DN2LZmwHrwwbK9d3zbiXgFfqibXGc92xyQRUw47JeCSbwHpQ10tZCihG
	oHMIEfe8XqC41KKaKhVab8m+t30lRyGYHg2T8G5FFVkzSyfa2dSWyPnCY0BkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1713779505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZaSy7FVbJoP4EX49cZLKiqu8pCbvcbD980UkLRZkgY=;
	b=A9FET54U0u2VLhk4w8GaeraUxffBpxrLXo8Fg3iakIxscdTRAgFEr+G2/vXwrOsSzkBpiM
	aEcz9/KRLiOzFY94VRlGg9IodNB0s7BG0NLTVNQaSvWtdUM6B6Aa4fPK195+T9vtE1JoSe
	hObAnBAqzZRYoUWKyqfhWc252OCbDTv65tjhpZmoj4ds+AALLWDq6KlZX7wcEYUzrjvPDF
	/hX4070jNtqRr7sPW4dowTVAsra1s4qZXNfP9LHrA48cXaiCSGuFQuBDjftNDb8xy3xSpk
	fE8fARWK6/if7d+XdhDlag6pKoG8IlRqJdYK6Qzq78S4HneQTY49pu9GjdTqYg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1713779505; a=rsa-sha256;
	cv=none;
	b=i9MWXc2bX5sjEjBK9rf/b3sN+coZvOOZUBdYzlByfWkRs2SixdWsh1fL1NoeG2v6cbY/jK
	gmlGiZXC375lgI/uQO++aq1BiY3jE1pYwgiPpndUPTjDNzRtsfMlXrA/V5DcHMahta8zoV
	ZqVM2muTMcyI5k0UV+ww8KhAaT2mF+pe1iBTzZQaVtFIoj5rrPyp6KTnlEqFJX4r5XPIpB
	GCo7xk8ELLd6yiOpN73atQH8lh3f9lXTg/X87vfaI/ISvK2W2xgnVfMCp3JLuX6fhAKqgd
	NlAx4aovXcCQ1eFl+r2cp/Z7e9seXnoqumzwPQfMWTJ7N13z3gO6+iOm2LHx3Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 682D2634C94;
	Mon, 22 Apr 2024 12:51:45 +0300 (EEST)
Date: Mon, 22 Apr 2024 09:51:45 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT FIXES v2 FOR 6.10] Mainly camera sensor patches, but V4L2
 and MC too
Message-ID: <ZiYzMdbSqG2MAveD@valkosipuli.retiisi.eu>
References: <ZiYqhcm_iFVRc5dS@valkosipuli.retiisi.eu>
 <ea476466-6b73-49f1-ac9b-82b297cc5698@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea476466-6b73-49f1-ac9b-82b297cc5698@xs4all.nl>

On Mon, Apr 22, 2024 at 11:43:15AM +0200, Hans Verkuil wrote:
> On 22/04/2024 11:14, Sakari Ailus wrote:
> > Hi Hans, Mauro,
> > 
> > Here's a set of mainly camera sensor related patches for 6.10. In
> > particular, there are ov2680 and hi556 fixes form Hans and Fabio, your own
> > MC patch, fixes for imx335 from Kieran and Umang, DT fixes from Alexander
> > Stein and one Cadence csi2rx fix from Pratyush and finally my random series
> > of framework and ipu3-imgu driver fixes.
> > 
> > since v1:
> > 
> > - Squash Umang's fixes for imx335 kerneldoc
> > 
> 
> Marking this as obsoleted: I added Umang's fixes to the first PR myself :-)

Ack, thanks!

-- 
Sakari Ailus

