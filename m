Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B02613655
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 13:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJaM2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 08:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiJaM2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 08:28:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96A0F5BD
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 05:28:06 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bj12so28884223ejb.13
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pPYyreTiOvUnuedIZ5AUj4aRdT9PZm0my1YFLl1JtCc=;
        b=mC+adiF5xSx0OFq31AX07T7rwKHRdPIq88siHL+sgoQdlhH2I6jxL9A+HfQj5LHlrA
         8vAV7K5bquP4f316mcNEuwkfH/XrU/gnUEHHXr8QzKxNAWO92tjrc5OIhIR9359Hn+Ga
         GfUI8SacOrTZYuIskJIi3EKLZOT/VJn9/v6nUW4fsA+awn03SmGMjk5d2pgMRnz2wQbU
         +soIO6eg2IuOcFQIODe/+A/DMNrx6o+UWiKcJhMnmzOMEZ/Yobuf/xH0RUGt08m4hlH0
         yZtydg7kKRgQnNFGOHxiMO5EG1MaN8mGiJ3CacjqWZNZtEg1xik9NFRg7dMwvxMacXXh
         sagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPYyreTiOvUnuedIZ5AUj4aRdT9PZm0my1YFLl1JtCc=;
        b=rv3NDTdbpOIHRHVAIJiQeFADo/epv+F946jcf2CoT2aQdlgsShi3NnUbZDWfRQUqDG
         Oq6YVYOEnMJv8qymqme3aBvdOxQFUSOQ/O/0YxpzFWa9vzOyHmLSr5WFR4HNdpP2oIhY
         0ikBubfrpIrU4mJXc7l/ZA+nfIZb0wLW1krKK3DnjqP/FWmPkC3LBWNpbNUlhaluftxV
         Z5xtxGCJBaZRtoHnV0AK/jWtfs06LjxgeQCoyqU5ZazfzdXBMzY9XPME+4ZDhHAKYmuj
         A2jBMUCeXIRI+2YgLAU7/LUoiqH+RUct+7rdQmpjQKEnTb1G19ACPnc3r/jyEJxkpdvj
         PZNQ==
X-Gm-Message-State: ACrzQf2iyU327RuegWn2uN23sgZ4Nlv0Pm141eEKvNr+uiu/VQSKBkQE
        CCuHvDo5w6A1xHMm10Q33AS552AiMXFNMW363YR5jw==
X-Google-Smtp-Source: AMsMyM6W9DhvqbEnD+nLFS9y8Bvb3oYB9X5cAWDwkuwzoeA05vO+WMM+Z7UuX5e6ROEBxL3Pl55507zWG/GFijq3qGQ=
X-Received: by 2002:a17:907:d1d:b0:7ad:4a55:9f01 with SMTP id
 gn29-20020a1709070d1d00b007ad4a559f01mr12666403ejc.723.1667219285399; Mon, 31
 Oct 2022 05:28:05 -0700 (PDT)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 31 Oct 2022 12:27:50 +0000
Message-ID: <CAPY8ntAO2UP669Ycfgz5sDfgSakgGCpy+JodQ=0kP3gLSSRDRw@mail.gmail.com>
Subject: V4L2_SUBDEV_FL_HAS_EVENTS and (un)subscribe_event for subdevice drivers
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans & Sakari

A question raised from review of [1]:

Is it correct that any subdevice driver that supports any controls
should advertise V4L2_SUBDEV_FL_HAS_EVENTS and have
subscribe_event/unsubscribe_event core_ops?

I added that patch for ov9282 to resolve a v4l2-compliance failure:
fail: v4l2-test-controls.cpp(835): subscribe event for control 'User
Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
but it surprised Jacopo, and he has observed that many of the current
drivers with controls don't meet this requirement.

I just wanted confirmation from those in the know.

Thanks
  Dave

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-17-dave.stevenson@raspberrypi.com/
