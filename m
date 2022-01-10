Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3474898DD
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 13:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245674AbiAJMwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 07:52:49 -0500
Received: from mout.gmx.net ([212.227.17.20]:48853 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245667AbiAJMws (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 07:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641819163;
        bh=44C1QCkc5dbYSgD1wXRxOXbuYYbzrj+9OPsC4deq4qc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=L28+NKzH7oUvq79mlA46K5c/J2ckIyBDph+BlYSICsbyL6VWrfbd65fqZQycSRRZu
         2LSOxPBWCvbiYjLUAQAQ4ToMZoIyQzzNo3HutCuFL0ImEurDLz00Zmlcin5g+U/kja
         U3AGi2bKgyK7RKL+epFyzTln9tDtP3hJW9nl+xrE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bs20.server.lan [172.19.170.72]) (via HTTP); Mon, 10 Jan 2022
 13:52:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-491d504b-a8e8-490d-8353-bda143df9b20-1641819163636@3c-app-gmx-bs20>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1 MHz
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 10 Jan 2022 13:52:43 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220109080914.53e31572@sal.lan>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
 <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
 <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
 <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
 <20220106213045.6afe5a35@coco.lan>
 <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
 <20220107080625.00547988@coco.lan>
 <trinity-37466cd2-8684-4e53-a4a3-7ed406945e90-1641551917644@3c-app-gmx-bap54>
 <20220109080914.53e31572@sal.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3dCCJwgKNZ35il3VGA35PVlLMQSs7lz/OQwbSN3qZ3FH160Aw17S+4lPWKvAfrd3uU+5Q
 sK3FWC0m5/fgjzEZeGovhKLh2kdI9dd+ppdyXfM/tUuujbrqL49QfjjduKkUHD229inlvC/erPzU
 E9G05c+J8Ow+kNR/iMp6KaDCuuMFJk4nP+R92vDgfUta0mqqVJV0f38iRLD30cmKxhOagYESVlsy
 lXyZbHwoi4ctqrD0V9RpsB+jB+N8YrZWhzekXNtZysP3CZiJrGgnuNVsHX+tpwHPIPtFUnQqPLg2
 nU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QhuJY6/pSD8=:Aj0RbBr8ivdlu0TluoYyb1
 B7qSGEEREjGBIxfzuZTFqULatg6Zol8ppl21KFiJbNLVfOwHey6lsLT1fJ5Ac+0caBZ6QW7SF
 28hfXApQa01UyNkQkaKV+liS4Fa4qSmImrjyNTsTEWw+IurpinureqUMCl85r23vygnACdQHj
 5bXvnC8XzpBbXQkz1WFDW6XqPd2ci6UTA1WyHlSDH7n28sTti/6eHiYlHWQaua++Np8P5Y6At
 chQhChGrIqkkpI/FO21eaSHE9NvpnEDW53krEAXe9sE2y9h2mjesyKA74nkCUUACUSOb2WZu6
 ysRtG20T19rv7QcN2fgA6124zlYC8JbBAccTzdsbHm+L7FqEhEsz183/sgMrdpO7Kq57A7dsv
 E8qhdToWI0pyzco7kVCCKbHEtQ3a+aLtI9WmZYO9SC12NUFoIo/JKzGgnsvK9ZAZu8y9DKz1I
 xONpQ8ldZu1hj4rycR+uvnwHT/Dk6gWBTBfb6QmWL2kNqnGfDyE+fKgg+RA8MYngknI0JRpeB
 SDtktIHiiDFhfpgTH2oFs5da5xhUT/4j42fJH6hToHio2gtLUOltkq+c8yTkMLISo2m8cbRc/
 x9dhLlrMwklfFJqlm8Z8yJ7eN0RTlsdExCcsRwhrFbN3/aqobFlsgpMmtKfFhQUjDmZLAOWDp
 uqnTikRlKwq7iPsa7O1b9Rzghtc4atSOsqNbCFnR4l3wgywX+7p0oS7caFJiZ0ZLbGHwDa4HT
 EmB8WKR37+xCveBXcD26O2HiecBJo6mUsLtfEZzgYEuMLIklF2vQhprhssLbiJMA/huN6hJFh
 ELmtTxp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Mauro Carvalho Chehab" <mchehab@kernel.org>
> Now, get_frontend is an internal kAPI. If I'm not mistaken, it was
> designed to be used between tuners and demods, for the cases where the
> demod would need to know what was the bandwidth set at the tuner.
> So, I'm OK if it returns the actually applied bandwidth, provided that
> such value is not returned to userspace via DTV_BANDWIDTH_HZ. So,
> props->bandwidth_hz should not be updated after its call.

Good point. It might indeed be interesting for demod drivers, e.g. to
adapt the AFC range setting to the (band)width of the signal delivered
by the tuner (not that I know any driver which does, but hypothetically),
but beyond that, it has no use. So I agree it should not be passed to
userspace.

But for the hypothetical use by the demod driver, the si2157 driver
should return correct values, so the patch I submitted can remain as
it is.

Best Regards,
-Robert Schlabbach
