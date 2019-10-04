Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E81C6CB3A3
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 06:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfJDEFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 00:05:09 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:40707 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfJDEFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 00:05:08 -0400
Received: by mail-ot1-f49.google.com with SMTP id y39so4210841ota.7
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 21:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQYbhdJOmf85+vZmL78dS40nCOHSpAbHe/eRQiTKcmM=;
        b=vLcGAFdNuwxx1s6RmZzH+5G7kpu/USj4hy89inhynZ0FCTfHOoc5J1cBal5MyZuOGE
         qcZmmfupRzgM+RPZzey+7ezali/0nPBI9W1aegrW/Ndt/7k7VAC65ydp5XzT4GyxqSZi
         T0qdLVaA7/y0qDzGrVTOsxHgMldRs7NbBNlaxNNW3n8djJM33xxKSREQ3sNbmA6sujCl
         VnAz1J0uAr5+i60dcAyiuPWyrw7UGYgPfm+S3ThJCXvMfqYXDp1h3lwf2JtmH9bjTSFI
         4mEoDBiDMXE1X5o/imvfWTo70QgFcF7578TRjUcAo7N1Upvv24w9Q4NJz0ui4U40RTGb
         oMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQYbhdJOmf85+vZmL78dS40nCOHSpAbHe/eRQiTKcmM=;
        b=j86wm4hQ5ShyJCGv1TzSzRWmf/+/OR01vP8bE5jbFpu96rXsRpSq2TO8dakuAvtHl/
         gfdT5xlG9bQKdrc40Mlu/UvGwnUyskdkRoZA0BQB0Gvr3litoEAJVDUGUrv8/gTiQe/c
         NVf+C7pXfw62HIM7YkZJsM9PaV608JztPz/v4C5Vj8nSiJSdSS2C7UgiD2BFRbAEOwez
         K4a8dNNc1lAF5dyFJ6XaXA+XsA5BpGlXqXuo2JhKRl1VoZvMIbuIw8o7v6202WKrckNT
         lbaJgRwZooJE1J0/5g6AUd5IBSEnhyRF94QNmbBMrZJTOKUQwPvjCc/BlmQug7PGlUGQ
         APGg==
X-Gm-Message-State: APjAAAVFe8L+s/Kbv5MfkNyw2j2rqVOiOAOT8S1Uvolka1TdQX0vGOtU
        mEWFrS5ezKFmeP8xnCKbNVntEcbX
X-Google-Smtp-Source: APXvYqyFI5LLnKwz0UdS1x3d/QmSuoAbNxR8nNSDJP99B9evTgT9knmtYeVTxekdlZjlkAV5pY0ThA==
X-Received: by 2002:a05:6830:44f:: with SMTP id d15mr8554254otc.115.1570161907608;
        Thu, 03 Oct 2019 21:05:07 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id z14sm1386166oic.13.2019.10.03.21.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 21:05:06 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v6 0/1] cec-compliance: tuner control
Date:   Thu,  3 Oct 2019 23:05:05 -0500
Message-Id: <20191004040506.31488-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003031816.168985-1-c0d1n61at3@gmail.com>
References: <20191003031816.168985-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series implements analog tuner step features and cec-compliance tests.
Added tuner_ctl_test() to test new tuner features implemented in the cec-follower.

---

Changes made since v5:
  - Add missing fail_on_test(cec_msg_status_is_abort(&msg)): hverkuil
  - Remove redundant test unrecognized_op(&msg): hverkuil
  - Refactor tuner_ctl_test to use memcmp(): hverkuil

Changes made since v4:
  - Add TOT_ANALOG_FREQS macro: hverkuil
  - Rename function to analog_update_tuner_dev_info(): hverkuil
  - Set freq_idx in analog_update_tuner_dev_info(): hverkuil
  - Reuse info variable in tuner_ctl_test(): hverkuil
  - Refactor tuner_ctl_test() to leverage timed_out_or_abort() and
    abort_reason(): hverkuil

changes made since v3:
  - Correct commit message for tuner emulation bug fix
  - Refactor analog_get_nearest_freq_idx() to return freq index
  - Refactor analog_get_type_system_idx() to set device info
  - Add macro ARRAY_SIZE_ANA_FREQS
  - Refactor tuner_ctl_test() to use std::vector

Changes made since v2:
  - Fix bugs for tuner emulation
  - Add freq_idx to cec-follower state
  - Refactor tuner tests into a single tuner_ctl_test()

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

Jiunn Chang (1):
  Add test for new features in cec-follower

 utils/cec-compliance/cec-test.cpp | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

-- 
2.23.0

