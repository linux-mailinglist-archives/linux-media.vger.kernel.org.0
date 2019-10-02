Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE872C49FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 10:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfJBIwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 04:52:20 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:43911 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725852AbfJBIwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 04:52:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FaMpivBssop0AFaMti3hJ4; Wed, 02 Oct 2019 10:52:19 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>,
        Vandana B N <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] v4l-utils: remove utils/cec-follower/cec-log.h after a 'git
 pull'
Message-ID: <ff10119d-4b39-8179-16f1-e6d96a345b0d@xs4all.nl>
Date:   Wed, 2 Oct 2019 10:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEtpynDlcSvlrAiuYtv+2Mh97mtzrtPRkLITseGGd2MfQ6m5fL0PAAnTDizZhSv1aeS+Fq6NXBQGmtkLMHLWlGSpwHGOETKDCO+pT8HDm/efCZZPo3El
 7049WrSfQ5ErO2kFQzHv8L9b0QutE1vEMf/PrtMI8r1DkAMmmhG0yautZZAuvER/ddc0D1xsTImy+Du0crypbvWJBKr41nfjLWFk6tEu9TLqkMiWTcgwUDwS
 gf89ZVnLX10TXa+1Yc0Z/w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a heads up: I synced v4l-utils with the latest media_tree master branch,
and that required some reorganization for the CEC utilities.

If you do a 'git pull' in an existing v4l-utils repo, then it will fail to
build due to an orphaned utils/cec-follower/cec-log.h file. Just remove it and
it will compile again.

utils/cec-follower/cec-log.h was a generated file, but this generated file is now
named cec-log-gen.h. A new utils/common/cec-log.h header was also introduced, so
cec-follower sources now include the old generated cec-log.h instead of the version
in utils/common.

Of course, if you do a fresh git clone, then you won't have this problem.

Apologies for this.

Regards,

	Hans
