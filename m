Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4696B2B39D9
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 23:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgKOWYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 17:24:40 -0500
Received: from www.linuxtv.org ([130.149.80.248]:32916 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727852AbgKOWYj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 17:24:39 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1keQRl-00Dodp-4o; Sun, 15 Nov 2020 22:24:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1keQUo-0005JA-O8; Sun, 15 Nov 2020 22:27:42 +0000
Date:   Sun, 15 Nov 2020 22:27:42 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1795520440.46.1605479262655@builder.linuxtv.org>
In-Reply-To: <759461501.39.1605258198400@builder.linuxtv.org>
References: <759461501.39.1605258198400@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #359
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/359/display/redirect>

Changes:


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building on master in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
FATAL: Invalid id: Process leaked file descriptors. See https://jenkins.io/redirect/troubleshooting/process-leaked-file-descriptors for more information
org.eclipse.jgit.errors.InvalidObjectIdException: Invalid id: Process leaked file descriptors. See https://jenkins.io/redirect/troubleshooting/process-leaked-file-descriptors for more information
	at org.eclipse.jgit.lib.ObjectId.fromString(ObjectId.java:203)
	at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.revParse(CliGitAPIImpl.java:1041)
	at hudson.plugins.git.GitAPI.revParse(GitAPI.java:331)
	at hudson.plugins.git.util.DefaultBuildChooser.getHeadRevision(DefaultBuildChooser.java:129)
	at hudson.plugins.git.util.DefaultBuildChooser.getCandidateRevisions(DefaultBuildChooser.java:111)
	at hudson.plugins.git.GitSCM.determineRevisionToBuild(GitSCM.java:1145)
	at hudson.plugins.git.GitSCM.checkout(GitSCM.java:1298)
	at hudson.scm.SCM.checkout(SCM.java:505)
	at hudson.model.AbstractProject.checkout(AbstractProject.java:1206)
	at hudson.model.AbstractBuild$AbstractBuildExecution.defaultCheckout(AbstractBuild.java:574)
	at jenkins.scm.SCMCheckoutStrategy.checkout(SCMCheckoutStrategy.java:86)
	at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:499)
	at hudson.model.Run.execute(Run.java:1894)
	at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
	at hudson.model.ResourceController.execute(ResourceController.java:97)
	at hudson.model.Executor.run(Executor.java:428)
