Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6E872FF47
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 15:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244790AbjFNNBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 09:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244791AbjFNNBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 09:01:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365A4A0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:01:07 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso6813805e9.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686747665; x=1689339665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5eeU3MYYXAYh2E5iCYKDr0TLnHyRTVAM4sI1Tdjqz8=;
        b=EGjtiqdErQZ0KDQ8990qF7pOqUkaf1ArXWy0+JpSR0mhO8TcX0hY5684CRE5fr4AHy
         O3WzddL/wzYEMwSglnimoysLKP0ZVfo2n2ACo2QA4qDHkt06eteHRORlp92KV95PCxrN
         CIdglY2XEhnZPcs0VSh7fuC+2sJwUw8G43Ay2fcXoWdfxTUBYjJZDqo9i1sW3n9hwxqb
         d+Uxot/06xwBJGFaSseqVwhqGYAf3MSyT2YlA+thnJEimiazB6kJtBeQUR43iF9+5sxZ
         FHecowOQsrXXeopZuoKhZze7YQ3dkLI9jJm+aQRU2OgfgQnOqx2/SscCbJYtvxJLLzDh
         OaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747665; x=1689339665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5eeU3MYYXAYh2E5iCYKDr0TLnHyRTVAM4sI1Tdjqz8=;
        b=THVKrhrAFcpbx5szzhvoUXNNWsl4332I1haW10AjEWKlJMq8DXahftWTzhZTDp4i8i
         u94UV9rjVNdsVe9L1N+4rRuemvDBqNl6uPgzB/og3Zn8s6O9ZF74oKpgkyg4Q/IKPB+O
         3oNmdMRGcKGybq7mwoswIc9f/x6ENcuh9zw9GM9ItKkAt7jO3jrfoz1HdcdFeMV1r4bG
         gl/oPpPkBAR/KlPOfk6Re0gKtP2CNtCiXSSPmXQQMg4mYMbEmn15GjdgtGF76W7ufwPW
         mox100szJxN5wrhD2Hj29YYpLPqJBT9fpVh/QUSCeTNZXiFB0eE60jq5vfmQ5DkUD5MB
         8TjQ==
X-Gm-Message-State: AC+VfDxFQclNOJM05wPCAro9MazqGHOEXjyf8APD/Q0jHnxc7zag8tz3
        fMbPRkEwiBw03H9ulXD2KbONR0sWrutohn7h3lw=
X-Google-Smtp-Source: ACHHUZ5alq6jROl2EwYWwxC0BtpeEy5h6H2vpH7SdWURxFLJDdPrekGdUaWaJ6LxOKtASUQK/VdPlQ==
X-Received: by 2002:a5d:480f:0:b0:30f:bf9f:fb98 with SMTP id l15-20020a5d480f000000b0030fbf9ffb98mr6818145wrq.28.1686747665714;
        Wed, 14 Jun 2023 06:01:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y14-20020adfdf0e000000b003063772a55bsm18140947wrl.61.2023.06.14.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:01:04 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:01:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     hdegoede@redhat.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: atomisp: Add input helper variable for
 isp->asd->inputs[asd->input_curr]
Message-ID: <533f6930-434a-45f3-afff-127003fa64c9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans de Goede,

This is a semi-automatic email about new static checker warnings.

The patch 9f221053342a: "media: atomisp: Add input helper variable
for isp->asd->inputs[asd->input_curr]" from May 29, 2023, leads to
the following Smatch complaint:

    drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr()
    warn: variable dereferenced before check 'asd' (see line 4268)

drivers/staging/media/atomisp/pci/atomisp_cmd.c
  4267		struct atomisp_sub_device *asd = pipe->asd;
  4268		struct atomisp_device *isp = asd->isp;
                                             ^^^^^^^^
  4269		struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
                                                                  ^^^^^^^^^^^^^^^
These dereferences were moved in front of the NULL check

  4270		const struct atomisp_format_bridge *format;
  4271		struct v4l2_subdev_state pad_state = {
  4272			.pads = &input->pad_cfg,
  4273		};
  4274		struct v4l2_subdev_format vformat = {
  4275			.which = V4L2_SUBDEV_FORMAT_TRY,
  4276		};
  4277		struct v4l2_mbus_framefmt *ffmt = &vformat.format;
  4278		struct v4l2_mbus_framefmt *req_ffmt;
  4279		struct atomisp_input_stream_info *stream_info =
  4280		    (struct atomisp_input_stream_info *)ffmt->reserved;
  4281		int ret;
  4282	
  4283		if (!asd) {
                    ^^^^
Here

  4284			dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
  4285				__func__, vdev->name);

regards,
dan carpenter
