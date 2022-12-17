Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF1A64F924
	for <lists+linux-media@lfdr.de>; Sat, 17 Dec 2022 14:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiLQNxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Dec 2022 08:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLQNw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Dec 2022 08:52:58 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3034513F08
        for <linux-media@vger.kernel.org>; Sat, 17 Dec 2022 05:52:58 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id h8so2047388qkk.8
        for <linux-media@vger.kernel.org>; Sat, 17 Dec 2022 05:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=oLaywQixDy5jqgXvud/JWeGlvZzDXFQ/Bx5UmumaAhwup+GzI7GJyMvlDh5YN+z7UD
         qBTqqepBxVLRbkDcAbQyqc1zSqMIJN+bpUHvgu8FDZRlPqZthHI8kbgPte6ZNs7tTag/
         /kmFk7qHamvVnwUgi9Tu1GZ8Hyb3tBpmdVwEW+Oia6X4jrc+hqePU01DTxu93G/aZI1t
         jIbiMxM8NECszx64iSEKa727vEmWOV1h/ypF6cE2RjXRxc41FFvSD/R6mHBnH40yOqx1
         +EWdxSEKV96hxKOfBJXNADU2NuJ9YySsIZ2NNUFN+khQN9MDtJA8VRqznpifRzg4lXj1
         SOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=UZYKcXMiE3Vblz5XrL3SXmpuom0KGGf/TWSlff1hB0dsoPmVHQ3MDhbjTXScQcywCI
         9dbJA9rhp7kY1pHJVeozWyMFkacxQRnz6EQwLZkapm4IK1I0qJlVRzX97bxVDCysnXoa
         7vAriIkxv2UQEG+L2+7tyN1UWT6iu3jVsr1ELSFOQCN0Evw+5d0SN7rrPdyOWlFhajeq
         1G4MqmiO8IWwDVgEI6tNBeKTiVnEKLTUt7+lw03TVJPlI3/W9xUggWM+rM5u4kg7Za9r
         0AfgqxXcILRnOx6zRT0HJqHOxQcim5QlVCh0y+esHgMwR75gK++GfI4gJjRsN9DWyWBI
         2QsQ==
X-Gm-Message-State: ANoB5pn53v3FsWdfKaSdSkDVGc5Ajg9qSWv0uYd0HF8La00+Nr0aUIXN
        a9qWh6/uVOGJ1Hiv9YvRFxC7SvNx15r98Hmrwtw=
X-Google-Smtp-Source: AA0mqf5veG5m0KFxtltekMB/t+7J9Ay7F0eJtNYV6jqc4mmoBf9wX85C6XLGpjC/L9pLWXxj1RjljC8bS/NrkPx3jd8=
X-Received: by 2002:a37:f516:0:b0:6fa:118:11dd with SMTP id
 l22-20020a37f516000000b006fa011811ddmr67247476qkk.586.1671285177335; Sat, 17
 Dec 2022 05:52:57 -0800 (PST)
MIME-Version: 1.0
Sender: asfiss2018@gmail.com
Received: by 2002:a05:622a:38f:0:0:0:0 with HTTP; Sat, 17 Dec 2022 05:52:57
 -0800 (PST)
From:   John Kumor <a45476306@gmail.com>
Date:   Sat, 17 Dec 2022 13:52:57 +0000
X-Google-Sender-Auth: aKi8u7TXFcmP8fzGifwDVZht2jg
Message-ID: <CAMhHx7_25iTqddXDpWTO-Zkrq1EpS1pGiLHKHBVsiiro0Jhr_A@mail.gmail.com>
Subject: Kindly reply back.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings!!
Did you receive my previous email?
Regards,
John Kumor,
