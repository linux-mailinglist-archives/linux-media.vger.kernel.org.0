Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF016A9E4C
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 19:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjCCSRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 13:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjCCSR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 13:17:29 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA525D899;
        Fri,  3 Mar 2023 10:17:22 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o12so13724843edb.9;
        Fri, 03 Mar 2023 10:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=qNoJlVzDLj3C7IO7boVl6n7LcZYbFGSll0NN2TekRSHv73QZoaDlCn4i0fZwiH5J4b
         TtuSd2ZbCAykvwPbuHpKUuIZqbqtGUWZdQUgGpgHiMxcPOb4gpUNF0nw5E/HlIGomnPd
         UTQHuiZPV8YaCM3euNRYOjax6ZYsMjDlbXMCQq5a25UTzW118S+K7CelJ2MiLZwrgfGT
         +MPPxn4cjNcjam8yIxKp2SFSix4VAGL0w9Zr1LSYEbpWdppWBQLI9ik1NnpobC7vKOAy
         +ZUTH6YxssOEJ4mwMNddrgoYFH9OYkFb/cH9LxbgV3lfhYf3cItCObg4/cy6DSFGWr8K
         uBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=4Qlc11G28OnjOYbZTkvdopFD2clewVPgMg2XXXV2IwBOfUSyLOhC4Yyk/GcmUdEim0
         deJwAniEW6u/hknYD33uh3HH6QHlrAO54w8SZ1Ug6ZPD12D365ZNsD3a1udvGog029BK
         mqtQGVmARLuq3PdUdlOcmkv5eBgZl+oJfmL+otS/LAcK7iZ+zUt64I/ZjeUIHop7PW62
         isEDyyWsF9pXjFOIsZqcp4PcKSSZPYy0Wi0api/1KhsKQCLOrQk9jNPpsEXB3XyK3cBJ
         zONP5wJFTxr55f4WgAgbY6f6hQxp6y304ebKu5iDGhilKSEBLxwrZpP4jX04eYPmvuYe
         d3VA==
X-Gm-Message-State: AO0yUKVEftnLrx6nE5BKrjbs904CPAyWOpygmMuhfbniMvHdrcl8I1Vt
        x02SmiP/abYLYMgcNfAfCy4=
X-Google-Smtp-Source: AK7set/3QRyF+S4m1f2yO9mrlvrWxtlMCia754euuChYKCVrcGXFbvD/4Liz+ihXe82na8KJ0+oZeg==
X-Received: by 2002:a17:906:784:b0:8ae:ea17:bae4 with SMTP id l4-20020a170906078400b008aeea17bae4mr6196383ejc.30.1677867439958;
        Fri, 03 Mar 2023 10:17:19 -0800 (PST)
Received: from [14.2.2.97] ([196.171.80.178])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709060e0a00b008b1815e30e3sm1190099eji.117.2023.03.03.10.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 10:17:19 -0800 (PST)
From:   Farda Poyodi <p1.markth@gmail.com>
X-Google-Original-From: Farda Poyodi <p1.markth@googlemail.com>
Message-ID: <f8dcfcb5-ee15-d328-8d16-ff22dcd38982@googlemail.com>
Date:   Fri, 3 Mar 2023 18:16:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: emailoffice151@gmail.com
Content-Language: en-US
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4944]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [emailoffice151[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [p1.markth[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Friend,

With due humility; I sent you an email and there was no response, please
confirm to me that you did get this mail for more clarification.

Kind regards,
Yours in service.

