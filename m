Return-Path: <linux-media+bounces-66905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JcaSLs5sTWpczwEAu9opvQ
	(envelope-from <linux-media+bounces-66905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 23:17:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5671FB49
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 23:17:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm1 header.b=XdwZYmB9;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="Y 3TIAVt";
	dmarc=pass (policy=none) header.from=shazbot.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66905-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66905-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9756E3045455
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 21:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DA0329C6D;
	Tue,  7 Jul 2026 21:16:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C022420861;
	Tue,  7 Jul 2026 21:16:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783458990; cv=none; b=LODSOoUubVTorNpOgd3diKB3bmsu6TQkbzUefNp294hDrwUWOhRBOV4hcvPKzAF3S74zGWfIT5Ll13lBYIJzNh0HDiyXbViXFjr89GN86v+3TC/jPZ83nnCYUbayKRcEDvf4cc8yGlBnnNM4ejhtm4vNqys7CQGxxTAeDlUEDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783458990; c=relaxed/simple;
	bh=+mU2V2lNFf7RD4UqN0PvbUf1cG2Eudz94fXgpP0KWwE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/vgI6NtQWBceG8Yd4F62wzOWvCLuMpBptRgIlo+eE0Q5Ywbl6PaGz8liZCd83DPhGygoayrdWtHNshkEjMNbE+vt1EaDbWIYs8yt3tvKVLLR8cE5dYglHXmQdbmhf5DCcmZyNCGCqxuEGkNR4qQb+XnGJw2VGTMwLC0edufMf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=XdwZYmB9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y3TIAVti; arc=none smtp.client-ip=202.12.124.154
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DD2CA7A0109;
	Tue,  7 Jul 2026 17:16:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 07 Jul 2026 17:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783458985;
	 x=1783545385; bh=vkTzXFusKTTIzAQzapZbpKsgu5UXxCg9u56mTBnUn7E=; b=
	XdwZYmB9Wj4oqWvOIK7bccnJslD6HR8FgaMBfQWZYWFlT8Z+vBsobTe42nYcWuNT
	+zew7RpbwujCzxlPa/K+9CtdvsLHI0ctWZbEXCzCkMvjD7cEZTlY4DKEe2oJsBUq
	ehU7OuLiOckXV+d4s7PX8BBMjP0w/KzYp+y16Eu+0L20qbFDE9O6AjZ9U5wxJAcG
	SYf/qx8c8cXSd4ji5TAVU4kYWkld7UVzo8VrCvFTkMohgtd6SQiHabu4C5zJYzmj
	C2acCPSiQ6W3TvfQTVnpq4v1nETBDUJ1HoTZoPKUbONgVMizM6ueeYoJbPwYkQaY
	IMBGexgUoF09FW67PBZw+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783458985; x=
	1783545385; bh=vkTzXFusKTTIzAQzapZbpKsgu5UXxCg9u56mTBnUn7E=; b=Y
	3TIAVtivpTUnsA+Mi5eq5BacL2+3GBZIO595ClYpUhuD1u6wR90XAloOwCYGUmez
	OskdUD2E5iUR/R/NTAuE7IbFYmTl2bgCOxQnTzQg5tJQ9zJEdHaRplFzDJie15TT
	jcZ3eu4BsafddtPhge6Hui5x3yXu49noXegJza2H9IZwf6Nct/7f93lLTTsBWsy9
	thJKxdx1709dmZfP2wYpG+Oh3kTQYCEIA1X0KHKaSMRfggD7L48qwehKpG/rGYSP
	V36JWk1GmrFwdXj+sdlFJRItNyAxtH1Yqk82z4F4e8nzzIbjpSczsdGMrPvruzod
	8mo67cTe+SZJZ21BNDLWA==
X-ME-Sender: <xms:qGxNaiqsjFChoxPMCCyTFgtWVk59FW8Tj_bPLLiwwekTSBLycVJfLA>
    <xme:qGxNasXZ7d3K94TrK5Hqd-3_KqmcGGHNUgBnDM6KS-Fh80B__4oSHpa-2NLhxHVWX
    VlWyMIrNfd3S6GKpdikEZJeQCvdOoaklUaRye6B3Mg-0xLfQS2cnw>
X-ME-Received: <xmr:qGxNah4Q0WO-OL2gA9k_5tAKz4mVcqOEQK0vMrpOq-SY9ibT9UZkQnU_rFI>
X-ME-Proxy-Cause: dmFkZTGZWM0TZAYrez3OUUVryhpKd4yBz4AC3t1m3FkOUK7rQ5mGJ4wrt4utdwOVYPjpQp
    vzQtgJbhl8rO/x/CT9lk4Zp3f4iiNmlVyK9JAdRnk+zJK0ETjdKCobP3R9NLjCnoEjfNAv
    txL/7RwaZE/cmZiUsnkpcFbWnkixRDRAG9X+ot3yl5IutpYx6Jdahs0nXCnd4lBTXrjGX/
    QN9h2Lvfl1ViCbBWWKbgcHme930j7OPe4HLWznK0DBqLyQX0WvphwSbm+uDQ8ztc5iBuTi
    +FV3waBa2MmWtUt0rU/S1hteG77+Mx6/10h/wbTQKXc41WSIOLVnSrvU4tkxSuwq2S09ig
    tWNR7X7iLIx00DcIlNZrohC8zkRj7NAdZtje+7b9qpULkOfaliC1QJilJB/V+S4w1GzLSN
    ipP6jo5pnbodPKAvNK2guRF7NeGQ8dabSCInLGizMzmO74o37/mas7XpniWxhmnGjNEusz
    +TMTFHHYYyCXNO/5ssMxGsxLoA+O/0gJB95eMgKsC8Gv+jOPFhAvxuvYbKuiXKlZ92SHut
    /Ry0n610i7H7Ougj/OfoRPKK41qb7/q+1BIWFVhXOAXDzwcVDwP4Je/OOiS6PWW3J5Q9et
    Tgb/hc3n8cF/fPpQLhwhj/AI+cojyxehy42/j85EzmTuV/uvMLHOERPoKljw
X-ME-Proxy: <xmx:qGxNai0YUQKckzrnWgqMvctSdfFOW7SlApkhvhKvdILX6E9_yle2RA>
    <xmx:qGxNag_5eHBCfXMhWqA9g-yhtlg2eDA3EQzPl-69iyFuq1zFTNulpQ>
    <xmx:qGxNajuW9aDdn3mdSBIA-9HdtfcU1HNFoICIN5LlnG19xbX3HA4mMA>
    <xmx:qGxNaspLtqRXcjTGjtK42yqtwdLxJgghDB44m-4kK_bj4Utvvv0saw>
    <xmx:qWxNar8-nB_4JdGiKT5Nlb8zOgYid1ncsMBRLiw0IAUZUBYTLIkJGT0O>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jul 2026 17:16:23 -0400 (EDT)
Date: Tue, 7 Jul 2026 15:16:21 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <matt@ozlabs.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Logan
 Gunthorpe <logang@deltatee.com>, Kevin Tian <kevin.tian@intel.com>, Pranjal
 Shrivastava <praan@google.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal
 <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH v4 00/10] vfio/pci: Add mmap() for DMABUFs
Message-ID: <20260707151621.6bb023d0@shazbot.org>
In-Reply-To: <20260701171245.90111-1-matt@ozlabs.org>
References: <20260701171245.90111-1-matt@ozlabs.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66905-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alex@shazbot.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DE5671FB49

On Wed,  1 Jul 2026 18:12:12 +0100
Matt Evans <matt@ozlabs.org> wrote:
> 
> This is based on v7.1.

Hi Matt,

This needs to be rebased.  Sashiko has failed to apply every version of
this series since the v1 posting.  It's straightforward to rebase, but
there are some subtle gotchas and running Sashiko against the result
indicates this probably still has some bugs to work through.  Thanks,

Alex

