Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5065D1645C5
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 14:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgBSNiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 08:38:05 -0500
Received: from sonic301-31.consmr.mail.ne1.yahoo.com ([66.163.184.200]:35279
        "EHLO sonic301-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727858AbgBSNiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 08:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1582119482; bh=U4cGXPmPGMGfLGFNv8d75zTpGkjAEJwC/RhoiDc/gRM=; h=Date:From:Reply-To:Subject:References:From:Subject; b=e6lfP5OwZMGdpKOLV+D5OOmpeW+cSETJxnOdc4ofOUyLJWBT0OAO2oNENQXLo07e3/5APTNbOUsAa+BZQNRMF/QLo8mZHLluPozEuS3P1GteHwrco66j5OepoOtSpD15YsyJo2dxnf4tfjkY2dEBA6l/zXk5wqqRoQ8rmE9naPrg5VhJXZ5Z6/CAW7wjpWtRnyDJqLHKEIIYQ0YaFx23/EcnYkpIxE0/VzMaVZzHnG1Add6K+JrO8NbU5isiulpm1gksYwE9G9qGozoc6atNpw1T7BLTgIY6QhC8sdzhE9C1Ksj6aaque9q23PNn6d+wMrWTrvK9HvhwFJIN8RIOpQ==
X-YMail-OSG: L7XPDN8VM1k_ej5tN3s0qqiAnYLlGxbKTY.efRaBl_BpqfBNrhE2UCGtkCxFjh2
 zFrQFPG.ymfw3dx2cUyOhVjci7xrB4RKJVSgQ7W7zvxBliSGLkS1h8nfG4Kz2wp9x6ekZe.NW5ex
 OeP1C5PmyKQuqJU08fEGnA4AbyWm9PC4_pwcQEuH2kQurCXnTj_a50.lFhoFq7WkChM7POUWE3Pz
 JRFwS.TgQ.Zg_oh5CBgXiiH_jK4TJzFBuDisbTWRMR2gw9W5bZ3RPboHBHv42WFr_zlTwMzYI6gg
 UgJscVvPhf4aduzuh8B5A9Y7Z8f8RILjKJ.WRwOd2_LBgjgdaTlz3vN58H04ZZXr012SmOL0uLSn
 l9TFXUsznFF63LSlbnvjE29WH5ked4v1.cm1UsDI.9cu26WiuwamJi3a8U4OJ.6jHnLRwi_jmtq1
 D68BKDicr4ThJdyQX2XKD23MUi2kBDmgRlDA.7xSK93Mn3x79Qn4RVoD6sqsOHEvnQUXnBQqGgWR
 UgI3ZpMnd7NMZZxi3J19ORRNTv4M1McIUTdebuQflcglvu7a5Nvqt9_6VHQuhyeKQWJW3m_JVypy
 Xt97M6c51gSv32Zdm1isFRR1K5sNg4q_Wgkon4V92dUaNyvwaUHxVL8xd1xm3uXEVLQ8C1rwJGaM
 OdxBITiGmgV8.gJgyS8JRTliMqdfaoWyzeiGrhNg1ZWjdriiTrpiQ22w6lIrRIejPxwT6kN7LoIw
 D6T23ewNMzE.a8qk69vGbmbv1zMRdLSOt4QAmT820G_MDw_LxZSA3DA9wTZJy.Ia3P5qlIwyQrJ1
 mIrcE5Y4S2WONwCBv5W53LzYqJcMje2GsBNfmqM_sZpVXFx0qQK324zuT_LAp0PFYuznKEGc7K9O
 SdqwdfUwZCy7uUfP7gV5WZW5ObHg..JMVLa1nxrIcIReq7fW6lDu9zDdQJ7RNgaSIZcKUAoHZogY
 4pHV4d8.088d97hDNICCiOerfrMDoR5KjTqM54yoQs9KnEsLQ4wD0OPekNv4xlp.DommL7aq2bbA
 NN9cx.SjNsZ5xnmPvENuF0MRplevTJrJLpb0R6TQf2kImGgbR52vvTEBrFWY5JKdznWHzC9cE_bU
 62hiFQbFxu6uWrnkKHBoKeGnZ3GiYXcrmHq9CPpx4Rmbx6u4LgpABKhrUQwEieA49MeZbZ5WzZVa
 VNnYaZ2LdQG284b2QihgH1.0rn7BB3amSiMHmyTTywRZQNSS6QTspsDTbh6rUX6fP.Avy5rbvnBi
 XPD8lhufIJIgWMxiLwg1m7KFPvORnzU_TnrEsnEaxqG70zH6A9RzXt97HzAA1HSFFUdI-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 19 Feb 2020 13:38:02 +0000
Date:   Wed, 19 Feb 2020 13:37:57 +0000 (UTC)
From:   "Mrs. Che Zakiah Binti Din" <chezakiahbintidin11@gmail.com>
Reply-To: chezakiahbintidin11@safrica.com
Message-ID: <1357575989.5087248.1582119477834@mail.yahoo.com>
Subject: Get back to me immediatly.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1357575989.5087248.1582119477834.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:73.0) Gecko/20100101 Firefox/73.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have a business proposal for you
