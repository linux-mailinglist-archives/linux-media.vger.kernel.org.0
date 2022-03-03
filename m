Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C694CC0AC
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 16:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbiCCPHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 10:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234259AbiCCPH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 10:07:29 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6031903F3
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 07:06:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j17so8370089wrc.0
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J1Ny1Kk0doTsM8cCUsEjo0HlvfjQ3SyUhdWEm2QCJkM=;
        b=w/so2gD3/QJiqxXU2uQbnIFgQ/SSyxDlL+L4v7KQCRpUBRpyGgC6TtR5IcKV1rjghj
         p/PQjWUguJqgokoLSwjcrmhVrngwvQn2OI+C1k9cfu3400yEX+GcaKQ3iZCcKDgT8lOQ
         5witJN6+J7m5NHY44Uct1m7RqxniLl4q7mxFb+etM0pby3VJIRRU+eI7SvKdUFjBC77c
         vgrnvXVv0LsJGkxjBTgXJdnZ3eJi38P1hHcOMIhxSy7+/6la0viMVQIUigVEAwhuYeef
         kShp06e9wuDyW4IvWTf4aiUsqe0kdxT+wF9C7+CnzmBBKDvp8s80dHlPk1VY2fHj7kpU
         NZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J1Ny1Kk0doTsM8cCUsEjo0HlvfjQ3SyUhdWEm2QCJkM=;
        b=WnGiZknC7NtsWwZzivEiBPLsiOatPs8WqQZLa7nXe+/x7NC0W1OuPQFsu99GCXd+f9
         jAWe6iCxtgQX03NhaOsktPlkzEMsvTf8oz7EgShfdCDnRGXP8nWSy4Tr/nqiL5YgkFch
         //QMjc+IkGeOV7Gz6Uue5VBt157xPqBze0aIfjVZiGju+FhLWOmGdOP6t+aiCQxhwLcK
         QgvMV0L91rB5VpN4uWWKQ5s859rus3LSHRIKo7Vt0aLNexcsu1kquUw2Uk/eOZH3bl3R
         VgnVUkhLQneD2kmSMAovFbJZrcRgI3hO3Bu2RWUkLAJWbCfOgsBW5+DlTvzbArIteNOy
         cvnw==
X-Gm-Message-State: AOAM531I2X3THs9onQr3O7P2Ppe+hA3eQmmJje5Xz3tUEVk7Nb9kcC9u
        g2e4H0F99YbyM86u4e+T6jqV82jLwxc43Li8
X-Google-Smtp-Source: ABdhPJz+l5RnTpeHxp44K7Vl6eEYwjbGTyaupO3qN2rK9H2EFJDLcC/E3+lmzMyQO8BEsc3PDML2rg==
X-Received: by 2002:a5d:47a1:0:b0:1f0:3440:2d04 with SMTP id 1-20020a5d47a1000000b001f034402d04mr5784070wrb.357.1646320001284;
        Thu, 03 Mar 2022 07:06:41 -0800 (PST)
Received: from localhost.localdomain (hst-221-14.medicom.bg. [84.238.221.14])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c511000b0038141b4a4edsm10757072wms.38.2022.03.03.07.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:06:40 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 0/6] Qualcomm custom compressed pixfmt
Date:   Thu,  3 Mar 2022 17:06:30 +0200
Message-Id: <20220303150636.577063-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v3:
 * added acked-by tag in 1/6 (Hans)
 * reword patch description in 5/6 (Nicolas)

Regards,
Stan

Stanimir Varbanov (6):
  v4l: Add Qualcomm custom compressed pixel formats
  venus: helpers: Add helper to check supported pixel formats
  venus: Add a handling of QC08C compressed format
  venus: hfi_platform: Correct supported compressed format
  venus: Add a handling of QC10C compressed format
  venus: vdec: Use output resolution on reconfigure

 .../media/v4l/pixfmt-reserved.rst             | 19 +++++++
 drivers/media/platform/qcom/venus/helpers.c   | 51 +++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h   |  1 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
 .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      | 35 +++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 87 insertions(+), 31 deletions(-)

-- 
2.25.1

