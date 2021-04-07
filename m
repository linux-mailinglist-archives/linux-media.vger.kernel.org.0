Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43183563D4
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 08:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345552AbhDGGSg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 02:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbhDGGSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 02:18:36 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC44C06174A
        for <linux-media@vger.kernel.org>; Tue,  6 Apr 2021 23:18:27 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z12so4739430plb.9
        for <linux-media@vger.kernel.org>; Tue, 06 Apr 2021 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=VW32J7M8xcfi4wYTs+XDvZnwBtFWqjut7ah3gP58f8A=;
        b=iI2/2qf5hSslmOPwGqGcYn6QOImgMBCt+AlA+SjziTCOYPZWxNZ8uqCs3eQoQl11g9
         yfhpR6gdaW3sPyt4kolJGiWQaeVZSrxUBvL8plSNkb/LY3cjJqYedwYG7vkUQv9nhG0f
         2C6fyf4o2Lf/grUiXEWRP2vIOYBIyhzA7s3oyG1TpRCpP6Tw83G4f9qyc5giUGfaVECf
         LjDPZ7aWy8bP6wuQFFLn6WO6fCOmn9PaLBzt4eZd8TetQjqxBQ742bDE8paNeaPh3fTf
         8zHKCJzxuTRJWri6+/eT3XvHq35CIdxOanxGi4/rOn0GkjVfzrE+7opptx+Q+HdqxY9C
         JOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VW32J7M8xcfi4wYTs+XDvZnwBtFWqjut7ah3gP58f8A=;
        b=D9hWq5PsP4pytWUro8TeFqPB0VywX2w78vwvwcdzB9OIpvTwPyLnLwOUQDKSrCYBQ8
         NgSM/r3pMhZBSU+PFrLXxnXdp5kKCw3NnqPUqoSb1tP+NUsWZI6hnF+orbBhaHsBrkB0
         yfbrChYrO7m0CfX1DhZMxDpqvivHjjyoXcLl9tYda8wiMvTfBl+IfedJiSkMukUGkmco
         RP0aim1Mgt0An0rFdBKDMv1jXt1tB75B/8Rwdr2OvA/DZwyFrwDPTXZI92Zu3f+9yPyH
         5W/l9GTnM8umoiRDOkXlqetFG3eiwVplp83pbI+567uh/s6nSqEi4MMSdzwnl8kOwsfy
         nNWA==
X-Gm-Message-State: AOAM532P6GqGX/aUTWjAHKW9Tde/lS3Zr8D8Ax2+/A5bwMGEIq7lNh5F
        Qx9cG+M9QtoPwd762/TJ17Q=
X-Google-Smtp-Source: ABdhPJx7cXc0nh92GqVSza8eSFSKxSzBRUyUQ4bek+icdjK3olDuII/iVSZt+/RtxhR2tRTu5BGp2w==
X-Received: by 2002:a17:902:820e:b029:e6:f006:fcff with SMTP id x14-20020a170902820eb02900e6f006fcffmr1684624pln.60.1617776306751;
        Tue, 06 Apr 2021 23:18:26 -0700 (PDT)
Received: from djbComp (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z1sm20230331pfn.127.2021.04.06.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:18:26 -0700 (PDT)
Date:   Tue, 6 Apr 2021 23:18:25 -0700
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [Outreachy] Introduction
Message-ID: <20210407061824.GA26340@djbComp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!
I am Deborah Brouwer, an outreachy internship applicant, from British Columbia,
Canada. I am interested in the project to improve the HDMI CEC compliance tests
and the CEC emulation of the vivid driver.

Following the initial outreachy instructions, I have been able to use the vivid
driver to set up two emulated cec devices and run the cec-compliance test both
with and without the cec-follower.  If I understand correctly, the cec-compliance
test uses the functions available from the linux kernel CEC API, to test whether
a CEC device complies with the CEC specification.  For example, the CEC specification
13.14 (Give Power Device Status) requires that the target device provide its power
status (e.g. standby, fully on) using a power status operand.  However, since the
kernel CEC API does not seem to return the power status, the cec-compliance test
fails. The CEC specification mentions that this might happen because this requirement
was optional in 1.3 and before.

In contrast, the cec-follower will emulate a CEC device that meets the CEC requirements
and returns the recognized power status operand signalling that the device is actually
on. This is why the cec-compliance test passes when the cec-follower is running.

If I am on the right track, I would like to start working on the Audio Rate Control
feature.  Would it be appropriate to start with the todo item of checking and keeping
track that the sending device is setting the audio rate at least every 2 seconds?

Deb
