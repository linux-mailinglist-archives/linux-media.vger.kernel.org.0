Return-Path: <linux-media+bounces-55947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ53CJoruGnhZgEAu9opvQ
	(envelope-from <linux-media+bounces-55947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:11:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC529D1B0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959EC308A525
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45FC32939C;
	Mon, 16 Mar 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="USsn5Id1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B521A95D;
	Mon, 16 Mar 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676902; cv=none; b=jEUefmdLpr++0E6LMmuuXgPPA6GDQLzzkTlzR1L3DPGBiSjtg9wN7PXtgGpUPlSbcI8jKjbXF3FksVREFC2FOG4lgtGsqNZVrBaw5FHy3wSHvhLOUrfTA/zfDPAbNTMhVamQU/MaRpA5ctqNXVav0rBIw4jYXBYcuzEnOnQ3mC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676902; c=relaxed/simple;
	bh=UyIZsrjKkEUaxHt7v/3reYw2j7lqEdtoJPKx1gtB+vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnn6takAcXSd3itde/2vXnBg5BAVVFLZBfDh4GMEt1QdX8LupMlW1PF9J+zG6TsvYAHCwsAEXaqXdvUosWHiisWp6xZ3SBKOlHdHtFaxQtS8KaOlVhAw2tcBYoTWKwbCO+ewsKVs11iyKVb1suVXmDKSCo5b1ZSYXwiRZPugn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=USsn5Id1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C71371FABC;
	Mon, 16 Mar 2026 17:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773676898;
	bh=vhmAKk+4/zPYmmEuoWhhmx7M2Dlod4lMaxpiHqopJPk=; h=From:To:Subject;
	b=USsn5Id1GmEi1ZI96WmPiKcNx5xtNxmE3ma2bHTvCZQCOUvz0rO8RB6gxDHv2RzIk
	 3JVU78saC5ArM5uD4CAO0axgfLhJ2i8IDHgYBhFLuuF2oPkd2HlJWChqXw6BYO3qE0
	 MWqeCtDUd2O1QTdeKO05aT3spatvaXHOwJxMSXQvekKQWGVa1drmsPebFltmKrklxI
	 ecq8AnEVqRs0HuZ4FYHvwG18t1FJt/EhdBlAIkLrXsN6+F6TEK7h8f24DdfY+ER6Vl
	 sau069TI35K4nCbRPQjwhSGm8iTSkH7aWZqbzUGjhxjYhfO8j4qh01eSfJFKO/P5xu
	 dehkwvvtlNz9w==
Date: Mon, 16 Mar 2026 17:01:36 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260316160136.GB43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
 <3b30506f-f651-44c4-aca2-29e99ce60cba@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b30506f-f651-44c4-aca2-29e99ce60cba@leemhuis.info>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55947-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ndufresne.ca,dolcini.it,oss.nxp.com,vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A0DC529D1B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:56:09PM +0100, Thorsten Leemhuis wrote:
> On 3/16/26 16:25, Nicolas Dufresne wrote:
> > Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
> >> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> >>> From: Ming Qian <ming.qian@oss.nxp.com>
> >>>
> >>> Fix a kernel panic when probing the driver as a module:
> >>>
> >>>   Unable to handle kernel paging request at virtual address
> >>>   ffffd9c18eb05000
> >>>   of_find_matching_node_and_match+0x5c/0x1a0
> >>>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> >>>
> >>> The imx8mq_vpu_shared_resources array is referenced by variant
> >>> structures through their shared_devices field. When built as a
> >>> module, __initconst causes this data to be freed after module
> >>> init, but it's later accessed during probe, causing a page fault.
> >>>
> >>> The imx8mq_vpu_shared_resources is referenced from non-init code,
> >>> so keeping __initconst or __initconst_or_module here is wrong.
> >>>
> >>> Drop the __initconst annotation and let it live in the normal .rodata
> >>> section.
> >>>
> >>> A bug of __initconst called from regular non-init probe code
> >>> leading to bugs during probe deferrals or during unbind-bind cycles.
> >>>
> >>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> >>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> >>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> >>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >>
> >> What's the plan to merge this? It fixes a quite severe regression,
> >> a boot failure.
> > 
> > To be decided this week. The commit message does not say if it was released, or
> > came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> > will go through next and backports, otherwise its is really tight to get that
> > into the RC series, but serious enough. Please fill the gap if you have time,
> > and I'll handle it later, probably tomorrow.
> 
> Well, FYI: the culprit according to the fixes tag quoted above is
> e0203ddf9af7c8 ("media: verisilicon: Avoid G2 bus error while decoding
> H.264 and HEVC") [v7.0-rc1, v6.19.6 (286d629d10640b)]. Given that this was
> * reported 11 days ago
> * reported at least two times
> * made it into a stable series
> it is something that Linus would like to see fixed by now in mainline
> afaics, as ""the rule of thumb should generally be "within a week",
> preferably before the next rc."":
> https://www.kernel.org/doc/html/next/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> If that fix is too dangerous a revert is of course an option, too.
> 
> BTW, given that the culprit made it to a stable series, it would be a
> wise to add a stable tag to ensure it's backported (it otherweise might
> be silent dropped and/or applying might be deferred).

Absolutely ... the tag here should help b4

Cc: stable@vger.kernel.org

Francesco


