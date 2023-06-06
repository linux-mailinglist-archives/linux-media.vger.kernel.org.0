Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5C6724A8C
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 19:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237570AbjFFRt6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 13:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238670AbjFFRts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 13:49:48 -0400
Received: from mail.spahan.ch (homer.spahan.ch [IPv6:2a01:4f8:222:842::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5935D1701
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 10:49:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.spahan.ch (Postfix) with ESMTP id 3F08C1C1BE7;
        Tue,  6 Jun 2023 19:49:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at spahan.ch
Received: from mail.spahan.ch ([127.0.0.1])
        by localhost (homer.spahan.ch [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id H1wnkWPBdAhr; Tue,  6 Jun 2023 19:49:42 +0200 (CEST)
Received: from [IPV6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c] (unknown [IPv6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c])
        by mail.spahan.ch (Postfix) with ESMTPSA id 4A7851C0506;
        Tue,  6 Jun 2023 19:49:42 +0200 (CEST)
Message-ID: <7d54dc04-6b0d-1dfd-333a-4d5497da6ce2@spahan.ch>
Date:   Tue, 6 Jun 2023 19:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU
 mappings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>, regressions@lists.linux.dev
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, fr-FR, de-CH
From:   Poncho <poncho@spahan.ch>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06.06.23 19:11, Laurent Pinchart wrote:
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?

Yes, your patch on top of 6.3.6 does fix my issue.
