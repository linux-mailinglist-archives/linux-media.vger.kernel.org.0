Return-Path: <linux-media+bounces-19681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F799EF05
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 16:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03EC01F21505
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 14:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BCE1DD0D7;
	Tue, 15 Oct 2024 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5jXg0rL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B31AF0DF;
	Tue, 15 Oct 2024 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001499; cv=none; b=S0MO71O8RONZt7NcbeFBacc9dRWQt7q7/+RRydCH/SnvOrW/6RhbmRHkCkn50hyWmH7lkJCW1fKuyDlfZEWhyrKfrLZZo6XBHout5VBRS85CamuRoMlwtv8hWM4zk459Xt4ff59/pb4AKG3dgDOqQVrD0ABmRVH0ILn0TsvoYmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001499; c=relaxed/simple;
	bh=3vBwi+Pr6hzgjIe2HmL1b25HddRXemUMiSA16ZJQljY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXjchS7XEu74isDuPAfKYz0m6TMEND4p9adBxYuxE0huLMJkes+Belav8aZgYfgUWiowGDvmP8ZUr4y1hAP+I3edezlQt1vD4206ZH01BxwyLa7ugERmoEFdz/M5omtaYqQEUqWvZORAQPahZLPOuYXJzyFtxipxNHpjQaQN/iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5jXg0rL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DFAC4CEC6;
	Tue, 15 Oct 2024 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729001498;
	bh=3vBwi+Pr6hzgjIe2HmL1b25HddRXemUMiSA16ZJQljY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5jXg0rLtQ+/C4ovQVfofe/AEEPcX/NKdF4LTE9iVuIk5l+S2GipFgSXSIeJ/ZXM3
	 MbbZOedjrahcQ6twK7Sl3P154+YkVEABhOZ6Z9g9cA+AMBLgH+BxQtiu7S13XjxvHv
	 6ft2dkEnv3i5bFzt6Fk1Es8WoCCxyUM48k10pwXNxmC15Su3DVmCph+1X+VWp+hlLc
	 N7Cf2qYnXSEH8zAxGyl9iSnXFgN7se7r8YNGcd/u8yUSSzLzTpt9LsQ0z52XDkD5Yj
	 IMwGy4oCrmgi0lU8bmm45gYi1t26vL/rIKnOoG249/bsrXgj4eMWsidzMxVKg6Xkfz
	 RIS3IDoNzaMSg==
Date: Tue, 15 Oct 2024 16:11:35 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 14/16] media: anysee: Fix and remove outdated comment
Message-ID: <Zw54FyNlLFRnakXB@localhost.localdomain>
References: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
 <20241014-devel-anna-maria-b4-timers-flseep-v3-14-dc8b907cb62f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014-devel-anna-maria-b4-timers-flseep-v3-14-dc8b907cb62f@linutronix.de>

Le Mon, Oct 14, 2024 at 10:22:31AM +0200, Anna-Maria Behnsen a écrit :
> anysee driver was transformed to use usbv2 years ago. The comments in
> anysee_ctrl_msg() still are referencing the old interfaces where msleep()
> was used. The v2 interfaces also changed over the years and with commit
> 1162c7b383a6 ("[media] dvb_usb_v2: refactor dvb_usbv2_generic_rw()") the
> usage of msleep() was gone anyway.
> 
> Remove FIXME comment and update also comment before call to
> dvb_usbv2_generic_rw_locked().
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Frederic Weisbecker <frederic@kernel.org>

