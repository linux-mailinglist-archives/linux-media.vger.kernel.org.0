Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C8063E866
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 04:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLADnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 22:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiLADnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 22:43:14 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DD75131C
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:43:09 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id x66so703205pfx.3
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qPymb+e3NO4fDhV92RsqtMV3xXUMKo3XaTx8p58m5A=;
        b=Selx3zhZk4GgEmgxsWporsd1zWh7PMSkGyijzMN6f6pd9s52K8k3xUkHFu94POsete
         N8Ot2RwADfvuFFc08yzZijr7YkVfDmHzIj/Rnhh5Jgxy2iH+s0GXRdGyT7EhRDtdgvSF
         5OiNCDqIgz5xGXqjfoVzIHLRl7trfUMnJuPdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qPymb+e3NO4fDhV92RsqtMV3xXUMKo3XaTx8p58m5A=;
        b=pw7oaqVTc02q1nFLRolsb/J1dNqDsVpJUggHkll1uux1fdb3Lye7w3EPap84h7D6QL
         cox3r+8O5fV2T4UYPM8yCzV5OZcCDi31XE7LY8BjzkXu/ouyaZ55x1Q2jHxdTW61BY4b
         SNeLhfG1nCNGtTFuBHigSoYC2iJe2iodJWBp1f+kIYz6bDF8S5z/qqSdzBNLq1+0Jsng
         4VMD3F1EpeYOVKzZ19cBIrCMtd0yS5YxuLlcpi/eF3CHH2M9DB2eA5TmN0+03qqJ5/V0
         TQX+sCZwLGJIUi0520u5Awzc04wH6dsETYpB+QAdRshxuhQlmZIbMmUGRzunIn3L15K/
         qjcQ==
X-Gm-Message-State: ANoB5pna5+uIJ3kBNTiyWGybqhdrHGSZsDEBRqXOGJtA1KRMVRjPO8EG
        n4pUYpA+bVY/B9OXuy2wmuT4kCouMXC5uQ==
X-Google-Smtp-Source: AA0mqf7YbWNGrDZHONIY4h3+nw06gneGj4zmsLbpIEiKbJXnYqcBWBgwIjHERbBBF4muCkwgMCC5KQ==
X-Received: by 2002:a63:4944:0:b0:44e:466f:4759 with SMTP id y4-20020a634944000000b0044e466f4759mr39458163pgk.194.1669866188500;
        Wed, 30 Nov 2022 19:43:08 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id y2-20020aa78f22000000b0053e62b6fd22sm2101369pfr.126.2022.11.30.19.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:43:07 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:43:02 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 01/11 RESEND] media: v4l2_ctrl: Add
 V4L2_CTRL_TYPE_RECT
Message-ID: <Y4gixnD/C8UeNtcX@google.com>
References: <20221201023204.2177458-1-yunkec@google.com>
 <20221201023204.2177458-2-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201023204.2177458-2-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/01 11:31), Yunke Cao wrote:
> Add p_rect to struct v4l2_ext_control with basic support in
> v4l2-ctrls.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
