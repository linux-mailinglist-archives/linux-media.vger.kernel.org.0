Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E973D561766
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 12:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiF3KOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 06:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbiF3KOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 06:14:05 -0400
Received: from knet-dmarc.kensnet.org (knetgate.kensnet.org [80.168.136.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB0A44A20
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 03:14:04 -0700 (PDT)
Received: from knetgate.kensnet.org ([192.168.122.1])
        by knet-dmarc.kensnet.org (8.14.4/8.14.4) with ESMTP id 25UADxx7025870
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 11:13:59 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 knet-dmarc.kensnet.org 25UADxx7025870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kensnet.org;
        s=default; t=1656584039;
        bh=/c8RqZ7U21IkoTHJ+RW1+Wct+x99Gs2o8oHschVaxrM=;
        h=To:From:Subject:Date:From;
        b=vsAYJaeqOLKnvYQq2Ud08jaKVKUpZ2Z5GvM+X9ZmdbSAdzBrUT9+P2bjatZAa8D7Q
         tK1/HwnwEC7DOlu9frTinJtPNEcuiRb1kO7SvKG3jH8Ss0Vd96XPk9O5EwVkH/cQ1J
         /GyBGW567zrPz7BH5OiVEIr4ss2yYBOP0LCma+wc=
Received: from localhost.localdomain ([172.16.0.45])
        (authenticated bits=0)
        by knetgate.kensnet.org (8.14.4/8.14.4) with ESMTP id 25UADuTT030798
        (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 11:13:57 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Ken Smith <kens@kensnet.org>
Subject: Suggested Update to the WiKi for HVR-5525
Organization: K-Net Technology
Message-ID: <56b9185e-67ad-5445-4d8a-513937d5bc94@kensnet.org>
Date:   Thu, 30 Jun 2022 11:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-kensnet-MailScanner-Information: Please contact the ISP for more information
X-kensnet-MailScanner-ID: 25UADuTT030798
X-kensnet-MailScanner: Found to be clean
X-kensnet-MailScanner-From: kens@kensnet.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


I have two observations about the Hauppauge HVR-5525 capture card 
following my recent experiences attempting to use it with MythTV. 
Whomever maintains those pages might like to make an update.

Firstly, although the card presents as two adaptors and has two inputs 
for DVB-S and DVB-T and could easily be mistaken for a dual tuner card 
but it is actually a single and not dual capture device.

Secondly, I have experienced anomalies with the cx23885 driver with that 
card on both Xeon and i3 platforms similar to the issues reported by 
others related to the Hauppauge Quad HD device.

Please fell free to update the WiKi as appropriate.

:-) Ken


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

