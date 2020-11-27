Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAA72C5EBF
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 03:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392245AbgK0CbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 21:31:02 -0500
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:57218 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726862AbgK0CbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 21:31:02 -0500
X-Greylist: delayed 966 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Nov 2020 21:31:02 EST
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jvanzijl@mediaboog.nl>)
        id 1kiTHg-0002Qt-4c
        for linux-media@vger.kernel.org; Fri, 27 Nov 2020 03:14:52 +0100
Received: from 83-86-106-21.cable.dynamic.v4.ziggo.nl ([83.86.106.21] helo=[192.168.0.100])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <jvanzijl@mediaboog.nl>)
        id 1kiTHf-00Cjef-0b
        for linux-media@vger.kernel.org; Fri, 27 Nov 2020 03:14:51 +0100
To:     linux-media@vger.kernel.org
From:   Jeroen van Zijl <jvanzijl@mediaboog.nl>
Subject: Logitech HD Webcam C270
Message-ID: <1ffaa4da-9c39-b072-cf97-388f2083e85f@mediaboog.nl>
Date:   Fri, 27 Nov 2020 03:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: nl
X-SourceIP: 83.86.106.21
X-Authenticated-Sender: jvzijl@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.4 cv=DJcxXwBb c=1 sm=1 tr=0 ts=5fc0611b a=o4rZkCiABj712GxFc9Wedw==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10 a=Qtdqo1-JAAAA:8 a=c4Q1ZChVYdfkM5AZFuQA:9 a=QEXdDO2ut3YA:10 a=vGpKUukCtIIA:10 a=KQnVc8Q3aC4A:10 a=U-PZt_B313byXpOkoA_-:22
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear team,

Just wanted to inform you that my Logitech HD Webcam C270 does not have 
USB ID: 046d:0825

$ lsusb says:
Bus 002 Device 054: ID 046d:080c Logitech, Inc.

Found more reports on this: 
https://ubuntuforums.org/showthread.php?t=1958610

Regards,

J. van Zijl


System:
Operating System: Linux Mint 19.3
Kernel: Linux 5.4.0-54-generic
Architecture: x86-64

