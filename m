Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B22B1774EC
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 12:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgCCLCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 06:02:03 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57997 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726694AbgCCLCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 06:02:03 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0e2:a5af:5d0f:8e60])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 95JIjjGK0EE3q95JJjzPPb; Tue, 03 Mar 2020 12:02:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583233321; bh=at+VsXDXrlCi2JPfrkgbr9NUrMH5/THUJI6GM5gLpPE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=dwZzbndjRoeIOvhY4MO1myd2s8ZrJB5kt3uZL4ALwUpVQqbKCakbY98QnlNHDUzAg
         yURA1V/UEwsjW2nS9+Qf939A6Hijii7HLVaVJTM6LaUR2LpA5ibnRLb1bX6606Fp7N
         3XxtR4BFoLkbx4QtCYpGJsw4u99FBOp6+lK/Zwe4+gKeewKfA6OZvS8wHTpaPAXxSp
         W0itYYHPCOIrbAREoTkDudY6h2VAyI0EcyLwvAWcy3Msf+kc8dlyHSnOZfu/fU0+gB
         u9RAg2G/tpo6ILAyGraFzalBegu0sUo5bVhJyxOhr38Qtof3a5f7QwF0ftftcosUnr
         UyA3OKyd0UQ6w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH 0/2] v4l2-ctrls: various improvements
Date:   Tue,  3 Mar 2020 12:01:58 +0100
Message-Id: <20200303110200.2571176-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfE3eFw8HVjrTgaSo7BBUWo/XaNk/Alv5sZRNy/PE0NIRm5ujaXkjV6p5ek+GRCKGCc3UPnLPN49fSis0IrGD0mg6icS8SYFv4A1cvwhTBLXnSIVzSUUx
 sQmfe+vNp3v11jO1RMpgxM/fKz3cAnvzqn1EGHk3tEXQ0nfCwtv7TC3dEcQEyjRRU3WCaBGg/IC6M+RRYbP02XFOx6Yn3vaUXnyvMkMbL/nukuaZyh8bQgKY
 eCn7/TCNsXiiYsWJNdJlsZ9MTgQhoTakEdiDONvCZOjTycYf9FdCreG6gu7Im1IGKlm77y57rh4ovrAkbtM5VQsPt+9oZhhm1Vm4AHO2Pic=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch improves WARN_ON handling, the second adds a
generic __v4l2_ctrl_s_ctrl_compound function and replaces the
__v4l2_ctrl_s_ctrl_area functions by defines that use the new
__v4l2_ctrl_s_ctrl_compound instead.

Regards,

	Hans

Hans Verkuil (2):
  v4l2-ctrls: v4l2_ctrl_g/s_ctrl*(): don't continue when WARN_ON
  v4l2-ctrls: add __v4l2_ctrl_s_ctrl_compound()

 drivers/media/v4l2-core/v4l2-ctrls.c | 26 +++++++++------
 include/media/v4l2-ctrls.h           | 49 ++++++++++++++++------------
 2 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.25.1

