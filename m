Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7986879CA
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 11:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbjBBKJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 05:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjBBKJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 05:09:26 -0500
X-Greylist: delayed 136 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Feb 2023 02:09:23 PST
Received: from mxd-2-a73.seznam.cz (mxd-2-a73.seznam.cz [IPv6:2a02:598:64:8a00::1000:a73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C6D86E85
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 02:09:23 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-68566d4878-kvdfc
        (smtpc-mxd-68566d4878-kvdfc [2a02:598:64:8a00::1000:a73])
        id 6ad55984ca0be2ce6a3567ef;
        Thu, 02 Feb 2023 11:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
        s=szn20221014; t=1675332562;
        bh=2HtJIEdDTUc0jD6+r5V0EN7uPQpPgWuCljoInRvP5pM=;
        h=Received:Message-ID:Date:MIME-Version:User-Agent:To:From:Subject:
         Content-Type:Content-Transfer-Encoding:X-Antivirus:
         X-Antivirus-Status;
        b=Uy6lbvVKLz99hFG2VMHOPzcNGkEW7m9lh8IXImhuAYSGj0dCKwAovZctmf3V1HTcU
         8FktS7Oi8HQ4aeKzqCqSS/CXltfDS9S9oSHmexV8Ez53Towpn+hlAD0l+THVtAzhge
         gstjo1OoEwz6TR8vC7u5wZB7tAXP7sD5Crv5DnGFLTDts6mfMSfKA7eAuPD7hF5k9Z
         Mwy79S70FM1QxCdPilwXuPlm1+hCQnZN+royQZ3VD+H8Vgyw09iCUCx2cxNNBAa87B
         ENKOwgt0R0IiBmRtyQU36aExukF4kjTIQZAAIoTIoeHi59+ezEX3MbQlQa3OQNY9p2
         NAxgcOpL9CxfA==
Received: from [192.168.20.101]
        (78-157-178-145-static.silesnet.cz [78.157.178.145])
        by smtpd-relay-8644fbf87-f96fh (smtpd/2.0.3) with ESMTPA
        id f7075be0-564a-4633-b7e7-ecddcd597160;
        Thu, 02 Feb 2023 11:06:55 +0100
Message-ID: <54c56099-501d-eb96-69d7-1237c9dd82a2@email.cz>
Date:   Thu, 2 Feb 2023 11:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Martin_Jank=c5=af?= <mjanku@email.cz>
Subject: DVB-T2 USB Sony cxd2858, 0572:2886
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Antivirus: Avast (VPS 230131-14, 31.1.2023), Outbound message
X-Antivirus-Status: Clean
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm trying to connect a Mygica T230 DVB-T/T2/C USB stick with Sony 
CXD2858, idVendor 0572, idProduct 2886 to my Ubuntu server 20.04 with 
5.4.0 kernel, but with no success. May I ask for a hint or help?

Thank you, Martin
