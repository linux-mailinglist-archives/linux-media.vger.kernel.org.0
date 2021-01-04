Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A432EA09C
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 00:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbhADXR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 18:17:57 -0500
Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]:40035 "EHLO
        4.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbhADXR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 18:17:57 -0500
X-Greylist: delayed 16800 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 18:17:56 EST
Received: from player795.ha.ovh.net (unknown [10.108.4.183])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id 284972A6FA2
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 18:19:16 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-77-132.w92-140.abo.wanadoo.fr [92.140.204.132])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player795.ha.ovh.net (Postfix) with ESMTPSA id 76C6C197EDB40;
        Mon,  4 Jan 2021 17:19:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G0050978a4d9-5f78-4547-b4df-003e9e764a6f,
                    1A05C619342D3EFD487FC4258F6FF4F8486F3843) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.140.204.132
Subject: Re: imx6ull capture from OV5640
To:     Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Message-ID: <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
Date:   Mon, 4 Jan 2021 18:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5626121835884139584
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieekfedtfefgteffueekveekhfetfeevjeefgfelgfevgfefgfehveefudehveenucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecukfhppedtrddtrddtrddtpdelvddrudegtddrvddtgedrudefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 12/30/20 6:45 PM, Fabio Estevam wrote:
> Hi,
> 
> I am trying to capture from a parallel OV5640 on a imx6ull-evk board.
> 
> Here are the device tree changes:
> https://pastebin.com/raw/PZpJjagJ

Don't you need

bus-type = <5>; // V4L2_FWNODE_BUS_TYPE_PARALLEL

in the parallel_from_ov5640 endpoint node ?

Regards,

> 
> Any suggestions?
> 
> Thanks,
> 
> Fabio Estevam
> 


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer
