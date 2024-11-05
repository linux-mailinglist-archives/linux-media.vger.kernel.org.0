Return-Path: <linux-media+bounces-20956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABED9BD3C3
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 18:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C54281F21BE5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA881E2825;
	Tue,  5 Nov 2024 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=nicemail.eu header.i=@nicemail.eu header.b="NQVdO6zs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FA3BBC9
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829031; cv=none; b=X2puZv/Ofqwp+uUngrWSqOLteozGwvCaJnc/pmkGKL1Uahus+5Nou4Ruz2hOkzK/ewiCayte2vYC5gmGHnyepIMXf+wKshayB1CEDpfabfFI+nrTcCQe7v9t/SJbFg6dwM1mRKbX+IYTe+GkgtnIL202MjGFk7QWyBjut1U55wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829031; c=relaxed/simple;
	bh=ITFirECiDt3c0GibNyEVCNS8BB15IREL7mDPwMX9TOY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MG9F0Fbp1OThtV36XRyBB4QkJSz+cBFvg5OMlcVh/dNNGRRA3pHhDfQ7DdTqmbfJCNPbgYz7GOU3Ip9nzas0kNzJrX/n29ObXBvkMRWZ1vZ+bLQg9lSbp/a17NkKAr3TWQIJZgn9pCwy/XQ2AkL0NW+7+ikJZSt3YvDDz2qmssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nicemail.eu; spf=pass smtp.mailfrom=nicemail.eu; dkim=pass (4096-bit key) header.d=nicemail.eu header.i=@nicemail.eu header.b=NQVdO6zs; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nicemail.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nicemail.eu
Received: from hermippe.uberspace.de (hermippe.uberspace.de [185.26.156.84])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 35B5017F4F0
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 18:50:24 +0100 (CET)
Received: (qmail 19546 invoked by uid 988); 5 Nov 2024 17:50:24 -0000
Authentication-Results: hermippe.uberspace.de;
	auth=pass (login)
Received: from unknown (HELO unkown) (::1)
	by hermippe.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 05 Nov 2024 18:50:23 +0100
Date: Tue, 5 Nov 2024 18:50:21 +0100 (GMT+01:00)
From: rayquaza-intermittent-comb@nicemail.eu
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Message-ID: <f20bd26d-b9f7-480b-b180-18624c134060@nicemail.eu>
In-Reply-To: <ZypPVUARggaAY-Xi@gofer.mess.org>
References: <a379eec2-b57b-4dd8-97cf-2018893670b3@nicemail.eu> <ZypPVUARggaAY-Xi@gofer.mess.org>
Subject: Re: Infrared Nuvoton w836x7hg - TX possible?
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <f20bd26d-b9f7-480b-b180-18624c134060@nicemail.eu>
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.578086) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.1)
X-Rspamd-Score: 0.321913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=nicemail.eu; s=uberspace;
	h=from:to:cc:subject:date;
	bh=ITFirECiDt3c0GibNyEVCNS8BB15IREL7mDPwMX9TOY=;
	b=NQVdO6zsIZbzE5JxA1lUkJrv/8ax36WUDuoSrNdalFnrFsO5Eyp2sp7uk0QLnjXMEA2S8hUEvs
	pJQ6/p9Qmxb4jmdjx5mgaVDWzrBUq+EF0dmyWLfvufbI6Turadi7QyWUu1rgFNWqrsrzOUWQxhEq
	dYdbWjDl6ZKRDKsu4tqgzZyIajjyLqt2xzH3KCaqT/EgDnSinDzJo8wFEBsRFbd+Ga0acoyI+N7v
	2ziPUudhYv3NMWUUXH562M1UE0+nJ//mv7LimESfrI50SmlfKOFVGf0eJdEQqycRU2ytip03FhZk
	hEaCtuSG3O0i/zJsSKWDc8Wlx1aYAdeEct6PWmdzJ+DzVpvELM27iH66sK/PQ5ll3FwpwhM4bBfI
	5cO9BsEdOW1l8XFqrSGz/V5nwtzgHJ59HBz4ycncNu758CEkKsvwST1zlot1M7JV0+o1SH+XoDyq
	veTayWtLHlO9pp4dEl4oa8b9Isxzioi0tz4ntkuWR35pNq/Ys75msqQyl/fxXRf3avlJkeRRpg50
	8/ZNiIJmIhVYlHxwbsnWLXgBm07xrNJMjwPwWeehMQObHac0AJqP+Dbuz15JoHwkttedL5KaXm2e
	6xhAIPKzDB/o0UwuFwEH2s4ZerwFs2gj2mOLbHpppnqh5x5QQ5ZVEhHWWoh2C1uxex1bTj/lFxR1
	U=

Thank you!

If there is actually sending circuitry, connected, I'll see when I take the box apart. But propably not this month.

Von: Sean Young <sean@mess.org>
An: rayquaza-intermittent-comb@nicemail.eu
Kopie: linux-media@vger.kernel.org
Datum: 05.11.2024 18:01:21
Betreff: Re: Infrared Nuvoton w836x7hg - TX possible?

> On Tue, Nov 05, 2024 at 05:26:08PM +0100, rayquaza-intermittent-comb@nicemail.eu wrote:
>> Morning,
>> 
>> I want to automate some weird things and I have an old intel thing with such an infrared chip around.
>> Lirc freshly installed on Debian finds the device and receives stuff from remotes. But lirc says the hardware can not transmit. Could this be by config or does that mean the hardware is definitely not capable of transmitting?
> 
> The nuvoton device can transmit, but the driver doesn't support it.
> 
> As far as I am aware there is no hardware available where the tx is actually
> usable because there is no way of connecting anything for transmit, i.e. the
> tx pin is just unconnected.
> 
> Is your transmit connected somehow?
> 
> 
> Sean

