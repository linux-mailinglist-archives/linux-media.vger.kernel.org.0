Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A8D4B3A8D
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 10:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbiBMJTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 04:19:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiBMJTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 04:19:51 -0500
X-Greylist: delayed 1903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 01:19:44 PST
Received: from vps-4745431.webdesignalafrancaise.com.br (vps-4745431.webdesignalafrancaise.com.br [162.241.95.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC9E5C344
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 01:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=escolanatureza.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Sw0L1zWRCdT/bbO8sppcwVYzauM28gHF7kkxMGPQDrw=; b=T9atU5AJ1JM8X2ZSC3XLy6D11H
        grBLBtKzv2KLF4PGMDNBqCcRp/Q1DKd4efVqeQVdQ2HTcIwxtkIY0dSy5psVE3/C4qhHiYSLpeCKc
        0zgbY4ywavTuCcs9bhbbAsIxzuyHHNprjMn0TMdEmlPbLcfySrWEaOzzOHatEmU/8JT6/pWUbu3c/
        nGA8UZXtRfDBCKCH5M2CXUVFucQ0iY/W1HOswI88kEnKql8jXIBokR81p6suzpa+NxxKKMKosxhCt
        UmA1W0g2Gnj2vDHr4QlCHJ5B9uLMlt1Jufu80hj1gmqaMPTKE92ODMzvrs28dXVxM7G+dHJAYEF1x
        ncngqa2w==;
Received: from escolanatureza by vps-4745431.webdesignalafrancaise.com.br with local (Exim 4.94.2)
        (envelope-from <escolanatureza@vps-4745431.webdesignalafrancaise.com.br>)
        id 1nJAY2-0005Wh-UG
        for linux-media@vger.kernel.org; Sun, 13 Feb 2022 05:47:58 -0300
To:     linux-media@vger.kernel.org
Subject: Recebemos sua mensagem
X-PHP-Script: escolanatureza.com/index.php for 81.17.18.62, 162.241.95.98
X-PHP-Originating-Script: 1009:PHPMailer.php
Date:   Sun, 13 Feb 2022 08:47:58 +0000
From:   Escola Natureza <secretaria@escolanatureza.com>
Reply-To: escolanatureza@gmail.com
Message-ID: <YuyDQ76LnXAcUyj7ABJzm2jGbEJNNqXbnL3Vi0p4@escolanatureza.com>
X-Mailer: PHPMailer 6.5.0 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vps-4745431.webdesignalafrancaise.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1009 991] / [47 12]
X-AntiAbuse: Sender Address Domain - vps-4745431.webdesignalafrancaise.com.br
X-Get-Message-Sender-Via: vps-4745431.webdesignalafrancaise.com.br: authenticated_id: escolanatureza/from_h
X-Authenticated-Sender: vps-4745431.webdesignalafrancaise.com.br: secretaria@escolanatureza.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_REPLYTO,
        HEADER_FROM_DIFFERENT_DOMAINS,PHP_SCRIPT,SHORT_SHORTNER,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6248]
        *  0.0 SPF_NONE SPF: sender does not publish an SPF Record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  1.5 PHP_SCRIPT Sent by PHP script
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.0 SHORT_SHORTNER Short body with little more than a link to a
        *      shortener
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Olá ❤️ You have unread messages from Carly (2)! Click Here: http://inx.lv/6qKW?gz8 ❤️ como vai?
Recebemos seu e-mail e responderemos em breve.

Att,
Equipe Escola Natureza.

