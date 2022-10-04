Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8905F3E04
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 10:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiJDIQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 04:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJDIPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 04:15:47 -0400
Received: from qproxy3-pub.mail.unifiedlayer.com (qproxy3-pub.mail.unifiedlayer.com [67.222.38.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAABA5467B
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 01:14:25 -0700 (PDT)
Received: from outbound-ss-820.bluehost.com (outbound-ss-820.bluehost.com [69.89.24.241])
        by qproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 77408802B732
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 08:13:28 +0000 (UTC)
Received: from cmgw13.mail.unifiedlayer.com (unknown [10.0.90.128])
        by progateway2.mail.pro1.eigbox.com (Postfix) with ESMTP id 025D710045603
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 08:12:36 +0000 (UTC)
Received: from box5691.bluehost.com ([162.241.252.62])
        by cmsmtp with ESMTP
        id fd2ZoBf2PBUL5fd2ZoXiHu; Tue, 04 Oct 2022 08:12:35 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=M4OIlw8s c=1 sm=1 tr=0 ts=633beaf4
 a=1BVlytWqdlHh70Ncy/nptA==:117 a=1BVlytWqdlHh70Ncy/nptA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=xsA4evdWpKAA:10:x_php_script_1 a=96GJKQGblXAA:10:x_php_script_2
 a=Qawa6l4ZSaYA:10:nop_rcvd_month_year a=PWwGcn7hdzkA:10:ip_php_script_1
 a=54uZggZoATEA:10:endurance_base64_authed_username_1 a=SPw3ek_uAAAA:8
 a=9CRYIYD5AAAA:8 a=9D5a36qdzEAJD57zReUA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=nrfmJR18ZzgA:10:uccc_2email_address
 a=zygC2g5RnO0A:10:demote_hacked_domain_2
 a=Pi-5HpKXajwA:10:unanchored_sms_domain1 a=wQbGkGY49W75J_HuIDns:22
 a=3yfpM5Y2AnVFoM7gnR0v:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=myplanit.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:From:Date:Subject:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tvKrWfIFi/2Kkg2NthdhtrsvGTVFUmVSLuz3VqgFWKQ=; b=MVsIlkPYcxIm111M9LuNL5eNaO
        B0aLCXlIf8dcWVE3NTlfvFhU/+9o9Lua0U5g+PqLDFYUhPkdlJtixVNJMzGrz4D1lvggrRCeCvbjI
        m2CuEsPNQo3D9LrLbvA1OB9jc8/XdqpOsA4ap1h7DsrIyhr9G/78hcw4PUS0Naq+134iqy76yDRJT
        q/i1MRLFQTH0QoO4KH8msiUltep/eYgFLKgSyQI7ZDIEjClkfWyG///+XESEWYoe9kZ/qPk8/1Er3
        l+bl5nmGZ/4Yk1dMBBnCGHxEwpwjed8eTzYItR+vw+GzcSXUJ2n9jsYO7ByeFfIlenV8dCtcB5ciW
        kZCsvcIQ==;
Received: from gnirilmy by box5691.bluehost.com with local (Exim 4.95)
        (envelope-from <gnirilmy@box5691.bluehost.com>)
        id 1ofd2Y-003sm5-UB
        for linux-media@vger.kernel.org;
        Tue, 04 Oct 2022 02:12:34 -0600
To:     linux-media@vger.kernel.org
Subject: Thanks for checking in with myPlanit!
X-PHP-Script: myplanit.com/index.php for 198.98.59.120, 198.98.59.120
X-PHP-Originating-Script: 1685:PHPMailer.php
Date:   Tue, 4 Oct 2022 08:12:34 +0000
From:   myPlanit Team <info@myplanit.com>
Message-ID: <W134r5hSS1rjf5bDfZCXYRlnANZnNX5mqXzDEQW1mg@myplanit.com>
X-Mailer: PHPMailer 6.6.0 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5691.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1685 994] / [47 12]
X-AntiAbuse: Sender Address Domain - box5691.bluehost.com
X-BWhitelist: no
X-Source-IP: 
X-Source-L: No
X-Exim-ID: 1ofd2Y-003sm5-UB
X-Source: 
X-Source-Args: 
X-Source-Dir: myplanit.com:/public_html
X-Source-Sender: 
X-Source-Auth: gnirilmy
X-Email-Count: 1
X-Source-Cap: Z25pcmlsbXk7Z25pcmlsbXk7Ym94NTY5MS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey ﻿💖 Alice want to meet you! CLICK HERE: http://lp.dkpro.ru/files/go.php?53pz 😍,

We're excited to connect with you!

We are building partnerships with brokerages and MLS's to bring in MLS data from all parts of the United States. We may already be in yours. To find out, please email us at: info@myplanit.com.

Thank you!
The myPlanit Team

