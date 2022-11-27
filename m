Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E6C639C9B
	for <lists+linux-media@lfdr.de>; Sun, 27 Nov 2022 20:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiK0Tpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Nov 2022 14:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0Tpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Nov 2022 14:45:43 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9A6BE23
        for <linux-media@vger.kernel.org>; Sun, 27 Nov 2022 11:45:40 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so7039016wms.0
        for <linux-media@vger.kernel.org>; Sun, 27 Nov 2022 11:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=oy6C2K78olhk33NZ4iGnwSUazq9VJ4RNTmQz6KiWuvgri2GoPbN788URw9JWoqVM/T
         Q/j611ZPLGAmzMTz8yZp0sJL+C0HQdkd8uWauf2cBoh4Fwzg9jXVXOfJu00+d5BqGuuf
         djlj4zo5jeZmOpcphqIINruufLsFU833pVjrdlPJnXaDs/92AAgtGUJD9UdKE8iUatCN
         L2LhY8nAqpWOKTuhpBvbzLajmkL77tTxZlh+V2i5Mp2LtJmsKA44UZosK1mnk0f2stIX
         bPCeSwWNR3p0gBRSZwXgJq9Ix0fGwJEhGqZ/Q7O/In+1fOVUZBfOzao7+JNOK8kJO8qV
         L+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=XEYLtPR/11CULb+wC7NXe9g0xXXDCB0qwMyHlGELSR+zC+93MWAW7ojAMEJdX29zUv
         xN+Xgb1silQZrCLHUKLb4N3FHhqJOQxQXpsEfFCAOUvq/duOyfbbOat7kney9Ul/XJbp
         4ypMPy/w9hxrC9M1YLFIJtr6FZBBGoGkIsLnmN0+RBfq8hRw5zsxoAndekOE/LQ4ADNO
         astRrN2pFkglNrDW8ZMjMzngm5WfwZvanJMBprwRx6bQJS8bGqwxTm3rTw4IM5bBFu0p
         j2H1gqKwoGSSKV596FejYeJnCgpYab8o2fN9CQYwfPqGdT4+XSCe7fRIgRnF+E9sTITU
         e9oQ==
X-Gm-Message-State: ANoB5pl6DG/p3e8V7FI1KCUrr2loUKwYT2BKRbxX+Scsuhhl4fDQXeNX
        X2qbR+RzvIZokBM7GHrQ7c3pGaTjWJ66F3L2N8PBiY46GkdDgA==
X-Google-Smtp-Source: AA0mqf4TS0+VFcPKmv+hMf2KlsGZkNdaMtWUGZn67v5s/ct5C4O05YKo0DfMl5zcng+RJpnC/bifBTRD1yPGnEobkmM=
X-Received: by 2002:a1c:f015:0:b0:3cf:7818:b123 with SMTP id
 a21-20020a1cf015000000b003cf7818b123mr38914019wmb.8.1669578338451; Sun, 27
 Nov 2022 11:45:38 -0800 (PST)
Received: from 332509754669 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Nov 2022 13:45:38 -0600
From:   HAROLD COOPER <haroldcooper810@gmail.com>
Mime-Version: 1.0
Date:   Sun, 27 Nov 2022 13:45:38 -0600
Message-ID: <CA+0JWiptaM5_uw3JZC+kVcHqvc4U9tZs8U6uinnBR_vTTdDsAA@mail.gmail.com>
Subject: HARD HAT
To:     linux-media@vger.kernel.org
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

To whom it may concern,
I would like to order HARD HAT . I would be glad if you could email me
back with the types and pricing you carry at the moment .

Regards ,
Mr HAROLD COOPER
PH: 813 750 7707
