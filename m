Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19A557D907
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 05:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiGVDgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 23:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiGVDgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 23:36:42 -0400
X-Greylist: delayed 398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Jul 2022 20:36:40 PDT
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B912193C25
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 20:36:40 -0700 (PDT)
X-mail-filterd: {"version":"1.3.4","queueID":"4Lpw124qHfz1LQKdM","contextId":"c17f7f46-faaa-49c5-bc20-a4f9bb209ad8"}
Received: from [192.168.1.17] (lfbn-rou-1-439-254.w90-23.abo.wanadoo.fr [90.23.32.254])
        by msfrf2610.sfr.fr (SMTP Server) with ESMTP id 4Lpw124qHfz1LQKdM
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 05:29:58 +0200 (CEST)
X-mail-filterd: {"version":"1.3.4","queueID":"4Lpw124HtRz1LQKdK","contextId":"221d96d2-09d4-4541-9d65-e6497cc953ec"}
X-sfr-mailing: LEGIT
X-sfr-spamrating: 40
X-sfr-spam: not-spam
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neuf.fr; s=202006;
 t=1658460598; h=Date:To:From:Subject; bh=Hd+qb2owvlQIRCwXEtFLMbtQ40K44NX5m/mp
  k+hSnog=; b=Zfg/CQkycRmAyCyymSFF4lD1OL+d8ALQKygSQ3aYVWCkv7iIDx8skvjM5bCASFTr
  nbUfZv3zHyODl+07kxiJe+lgYQ4XgmKFmrsFvOzg9VsgAdbpYowchmoR5LD6MLpyDSSLV3tJ/9MC
  EKO0zdtmM6SthX66kBMiZ8tFB3kRrePVDd4HTy0/m2yN6FuxPOzUlJGy/NLVXSenjevDE9h6j5QU
  +JAVXcZbaCMYp8CtF/Fph56lF+9O+fPsGDrrzLwYy5rY9+aF24rXSDJ0P0KK96DbWJJ1itf2je2r
  gOQJFds5565J98M4S4sOy10OIWw9F57aSa03oy0G8cRm66RqKA==
Received: from [192.168.1.17] (lfbn-rou-1-439-254.w90-23.abo.wanadoo.fr [90.23.32.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: coez.bertrand@neuf.fr)
        by msfrf2610.sfr.fr (SMTP Server) with ESMTPSA id 4Lpw124HtRz1LQKdK
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 05:29:58 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN) smtp.auth=coez.bertrand@neuf.fr
Message-ID: <8bd3b659-5e1c-4985-ceac-7b9956f2158f@neuf.fr>
Date:   Fri, 22 Jul 2022 05:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To:     linux-media@vger.kernel.org
Content-Language: en-US
From:   Bertrand COEZ <coez.bertrand@neuf.fr>
Subject: Adding a new UVC Device
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

I would like to add a device to the list,

Here it is : 5986:211b Acer, Inc HD Webcam.


Best regards,

Bertrand

