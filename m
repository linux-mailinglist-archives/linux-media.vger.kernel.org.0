Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E3E39C4F2
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 04:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhFECKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 22:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhFECKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 22:10:53 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E394C061766;
        Fri,  4 Jun 2021 19:09:02 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id h24so17314672ejy.2;
        Fri, 04 Jun 2021 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ae8aO+EcXpY+/Z6vk9bck8nM2UH/1bl+PzXd6sCUhb8=;
        b=eh8hMZC0XKYFIDWYBcJaE6kEw2ULmpOJ/a3PoxdAr62Hu3vqx3+x/OaoNrX9+1xMPY
         zCC/tLKzgbpX+AA/vy/XMzR6dzOOHfXkWNYVbwH6XrUMshnX9BR8O2FCa8uihDN8oKzm
         VC9lnvcAf1Mbn1nTTfe7If1r1NNpP9hWW/rWIpZH5tKRaPuWAir8cbe5tNKPCtQdCdoH
         Gj2piHRg5KqbSNdWBpLKkf8Yj/havUSlOK13MOVpzgnMEP0MU4ivqgnWLrSgSZyhmPRL
         inwNOJ7QO0ZvnjZqvZDFv6U0VnW14wz+D/cKim2K6qWiEbxqsf2A85Fs/RjzrdY/A1eF
         5YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ae8aO+EcXpY+/Z6vk9bck8nM2UH/1bl+PzXd6sCUhb8=;
        b=XH451L18CKauZ0W3Rerwfdcl82WuGeQTaBPs+PVt97oF9rrQpQDU7HF2NYFzzJ/Fzi
         76yQXH1XrmRKs0wo3DWaF4vmhwxGXQ2XxkZY81h48yyvDkA9qK1BcWO4rEQ3pahJnjDF
         y8iqktmlS1O/wAw/8SO8KCQvjhNsOWqVoYhIkOa5YX934X4qLcWeAVsAbSpRUkn9D0Ba
         6Z/cBmuM7pjMdIGyC8bHU01WbV9gw/UwSkMXLGTV6tSUSGTOu6QT0VUmN+RH9iSqsyXX
         IyiZCG7iajeRg2HZLgvWwpgm+KfXo24RHjuiaSZs3+7P6oe2zXiCPCw1ch9Hj+JzGN1E
         Qlfw==
X-Gm-Message-State: AOAM5333zlXPaTfx75MLavtzaXo/a5LFNHjGI8P7Fi8mcqk3Fp27YHV6
        lr29Ds6iB7m3gtbCEZa97xU=
X-Google-Smtp-Source: ABdhPJw0lyNr1u+lwMQPhKdENwjyWfuoxWWQmqVIfOrrTMlkHr2cQ3WLDO1DLc1q9sJt59LXfVZjUw==
X-Received: by 2002:a17:907:b14:: with SMTP id h20mr6996353ejl.257.1622858940994;
        Fri, 04 Jun 2021 19:09:00 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:00 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] Remove unnecessary tests and cast before kfree/kvfree
Date:   Sat,  5 Jun 2021 04:08:53 +0200
Message-Id: <20210605020855.1065-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(1/2) Removed unnecessary test of pointers != NULL before passing them to
kfree() and kvfree(). 
(2/2) Removed an unncecessary (void *) cast for an argument passed to kfree().

v1 -> v2: Added patch 2/2.

Fabio M. De Francesco (2):
  staging: media: atomisp: pci: Remove checks before kfree/kvfree
  staging: media: atomisp: pci: Remove unnecessary (void *) cast

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.31.1

